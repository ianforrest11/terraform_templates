# create group
resource "aws_iam_group" "this" {
  for_each = var.groups
  name = each.key
}

# Flatten the group-policy map
locals {
  group_policy_map = {
    for group, details in var.groups : group => [
      for policy in details.policies : {
        group       = details.group_name
        policy_arn  = policy
      }
    ]
  }
  flattened_group_policy_map = flatten([
    for group, policies in local.group_policy_map : [
      for policy in policies : {
        group       = policy.group
        policy_arn  = policy.policy_arn
      }
    ]
  ])
}

# attach policies to users
resource "aws_iam_group_policy_attachment" "this" {
  for_each = {
    for idx, group_policy in local.flattened_group_policy_map : "${group_policy.group}-${idx}" => group_policy
  }
  group       = each.value.group
  policy_arn  = each.value.policy_arn
}
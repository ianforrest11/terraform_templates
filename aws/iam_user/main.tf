# create individual user
resource "aws_iam_user" "this" {
  for_each = var.users
  name = each.key
  tags = {
    first_name = each.value.first_name
    last_name  = each.value.last_name
    team       = each.value.team
  }
}

# give users login information
resource "aws_iam_user_login_profile" "this" {
  for_each = aws_iam_user.this 
  user     = each.key
  password_reset_required = true
  lifecycle {
    ignore_changes = [
      password_reset_required,
    ]
  }
}

# Flatten the user-policy map
locals {
  user_policy_map = {
    for user, details in var.users : user => [
      for policy in details.policies : {
        user       = user
        policy_arn = policy
      }
    ]
  }
  flattened_user_policy_map = flatten([
    for user, policies in local.user_policy_map : [
      for policy in policies : {
        user       = policy.user
        policy_arn = policy.policy_arn
      }
    ]
  ])
}

# attach policies to users
resource "aws_iam_user_policy_attachment" "this" {
  for_each = {
    for user_policy in local.flattened_user_policy_map : "${user_policy.user}-${basename(user_policy.policy_arn)}" => user_policy
  }
  user       = each.value.user
  policy_arn = each.value.policy_arn
}

# attach users to groups
resource "aws_iam_user_group_membership" "this" {
  for_each = var.users
  user     = each.key
  groups   = each.value.groups
}
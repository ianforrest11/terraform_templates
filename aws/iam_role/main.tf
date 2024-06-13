resource "aws_iam_role" "test_role" {
  for_each = var.roles
  name = each.key

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = file("${path.module}/json/${each.value.assume_role_policy_name}.json")

  tags = {
    environment  = each.value.environment
    purpose      = each.value.purpose
  }
}

# Flatten the role-policy map
locals {
  role_policy_map = {
    for role, details in var.roles : role => [
      for policy in details.policies : {
        role       = details.name
        policy_arn = policy
      }
    ]
  }
  flattened_role_policy_map = flatten([
    for role, policies in local.role_policy_map : [
      for policy in policies : {
        role       = policy.role
        policy_arn = policy.policy_arn
      }
    ]
  ])
}

# attach policies to roles
resource "aws_iam_role_policy_attachment" "this" {
  for_each = {
    for idx, role_policy in local.flattened_role_policy_map : "${role_policy.role}-${idx}" => role_policy
  }
  role       = each.value.role
  policy_arn = each.value.policy_arn
}
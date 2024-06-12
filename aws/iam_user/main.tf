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
}

# Flatten the user-policy map
locals {
  user_policy_map = {
    for user, details in var.users : user => [
      for policy in details.policies : {
        user       = details.username
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
    for idx, user_policy in local.flattened_user_policy_map : "${user_policy.user}-${idx}" => user_policy
  }
  user       = each.value.user
  #          = aws_iam_user.my_iam_user.name
  policy_arn = each.value.policy_arn
}

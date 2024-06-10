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
  user    = aws_iam_user.this.name
  password_reset_required = true
}

# attach policies to users
resource "aws_iam_user_policy_attachment" "this" {
  for_each = {
    for user, details in var.users :
    user => {
      for policy in details.policies :
      policy => lookup(local.policy_arns, policy)
    }
  }

  user       = aws_iam_user.user[each.key].name
  policy_arn = each.value
}

locals {
  policy_arns = {
    policy1 = module.policies.policy1_arn
    policy2 = module.policies.policy2_arn
    policy3 = module.policies.policy3_arn
  }
}
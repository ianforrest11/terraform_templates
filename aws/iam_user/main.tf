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
  for_each = var.users 
  user    = each.key
  password_reset_required = true
}

# attach policies to users
resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  for_each = { for user, details in var.users : user => details.policies }
  user       = each.value[0]
  policy_arn = each.value[1]
}

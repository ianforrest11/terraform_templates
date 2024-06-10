# create individual user
resource "aws_iam_user" "this" {
  name = var.username
  tags = {
    first_name = var.first_name
    last_name = var.last_name
    team = var.team
  }
}

# give users login information
resource "aws_iam_user_login_profile" "this" {
  user    = aws_iam_user.this.name
  password_reset_required = true
}

# attach policies to users
resource "aws_iam_user_policy" "this" {
  name   = "test"
  user   = aws_iam_user.this.name
  policy = data.aws_iam_policy_document.lb_ro.json
}

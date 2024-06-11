# Output user information
output "users_info" {
  description = "A map of usernames to their respective ARNs and passwords."
  value = {
    for user, details in var.users : user => {
      arn      = details.arn
      username = details.name
      password = aws_iam_user_login_profile.this[user].encrypted_password
    }
  }
}
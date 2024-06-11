output "users_info" {
  description = "A map of usernames to their respective ARNs and passwords."
  value = { for user in aws_iam_user.user :
    user.name => {
      arn      = user.arn,
      password = random_password.user_password[user.name].result
    }
  }
}
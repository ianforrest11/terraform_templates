output "users_info" {
  description = "A map of usernames to their respective ARNs and passwords."
  value = { for user in var.users :
    user.name => {
      arn      = user.arn,
      password = random_password.this[user.name].result
    }
  }
}

output "users_info" {
  description = "A map of usernames to their respective ARNs and passwords."
  value = { for user in var.users :
    user.username => {
      arn      = user.arn,
    }
  }
}

output "users_passwords" {
  description = "A map of passwords to their respective ARNs and passwords."
  value = { for p in aws_iam_user_login_profile.this : 
    p.user => p.encrypted_password }
}
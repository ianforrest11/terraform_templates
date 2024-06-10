output "password" {
  value = aws_iam_user_login_profile.this.encrypted_password
} 
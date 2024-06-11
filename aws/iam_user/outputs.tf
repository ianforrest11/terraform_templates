output "password" {
  description = "The password  of the created IAM user."
  value = aws_iam_user_login_profile.this.encrypted_password
} 

output "user_name" {
  description = "The name of the created IAM user."
  value       = aws_iam_user.this.name
}

output "user_arn" {
  description = "The ARN of the created IAM user."
  value       = aws_iam_user.this.arn
}
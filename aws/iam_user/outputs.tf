# Output user information
output "password" {
  description = "The username and encrypted password of the created IAM users"
  value = {
    for username, login_profile in aws_iam_user_login_profile.this :
    username => {
      password = login_profile.encrypted_password
      username = username
    }
  }
}
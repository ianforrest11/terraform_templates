resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_terraform_state_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
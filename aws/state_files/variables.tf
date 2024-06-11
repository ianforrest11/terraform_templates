variable "s3_terraform_state_bucket_name" {
  default  = "iforrest-aws-s3-terraform-state"
  nullable = false
  type     = string
}

variable "dynamodb_terraform_state_name" {
  default  = "iforrest-aws-dynamodb-terraform-state"
  nullable = false
  type     = string
}
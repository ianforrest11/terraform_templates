variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "user_arn" {
  description = "The ARN of the IAM user to allow access"
  type        = string
}
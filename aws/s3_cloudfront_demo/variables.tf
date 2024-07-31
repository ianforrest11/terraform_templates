variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "ian-cloudfront-demo-logs-bucket-ap"
}

variable "force_destroy" {
  description = "Force destroy the bucket"
  type        = bool
  default     = true
}

variable "target_prefix" {
  description = "Target prefix for S3 bucket logging"
  type        = string
  default     = "log/"
}

variable "bucket_tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
  default = {
    Name        = "CloudFrontLogs"
    Environment = "Production"
  }
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "owner_display_name" {
  description = "Display name of the bucket owner"
  type        = string
}

variable "owner_id" {
  description = "ID of the bucket owner"
  type        = string
}
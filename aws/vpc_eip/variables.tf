variable "name" {
  nullable = false
  type     = string
}

variable "vpc" {
  description = "Boolean to indicate if the EIP is for VPC."
  nullable    = false
  type        = bool
}
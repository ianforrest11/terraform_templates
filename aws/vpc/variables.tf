variable "name" {
  nullable = false
  type     = string
}

variable "cidr_block" {
  nullable = true
  type     = string
}

variable "instance_tenancy" {
  nullable = true
  type     = string
  default  = "default"
}

variable "environment" {
  nullable = false
  type     = string
}

variable "access_type" {
  description = "used to determine if a VPC is public or private"
  nullable    = false
  type        = string
}
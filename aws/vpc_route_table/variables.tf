variable "name" {
  nullable = false
  type     = string
}

variable "subnets" {
  description = "The list of subnet CIDR blocks"
  nullable    = false
  type        = list(string)
}

variable "vpc_id" {
  nullable = false
  type     = string
}
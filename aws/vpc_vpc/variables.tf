variable "name" {
  nullable = false
  type     = string
}

variable "cidr_block" {
  nullable = true
  type     = string
  default  = "10.0.0.0/16"
}

variable "instance_tenancy" {
  nullable = true
  type     = string
  default  = "default"
}
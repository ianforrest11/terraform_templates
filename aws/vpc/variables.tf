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

variable "destination_cidr_block" {
  nullable = false
  type     = string
}

variable "gateway_id" {
  nullable = true
  type     = string
  default  = null
}

variable "nat_gateway_id" {
  nullable = true
  type     = string
  default  = null
}

variable "route_table_id" {
  nullable = false
  type     = string
}

variable "subnet_id" {
  nullable = false
  type     = string
}
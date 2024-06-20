variable "availability_zone" {
  nullable = true
  type     = string
}

variable "cidr_block" {
  nullable = false
  type     = string
}

variable "map_public_ip_on_launch" {
  description   = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  nullable      = false
  type          = bool
}

variable "name" {
  nullable = false
  type     = string
}

variable "vpc_id" {
  nullable = false
  type     = string
}
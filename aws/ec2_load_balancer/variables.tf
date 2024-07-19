variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "lb_internal" {
  description = "Boolean to determine if the load balancer is internal"
  type        = bool
}

variable "lb_type" {
  description = "The type of load balancer to create (application or network)"
  type        = string
}

variable "lb_security_groups" {
  description = "A list of security group IDs to assign to the load balancer"
  type        = list(string)
}

variable "lb_subnets" {
  description = "A list of subnet IDs to attach the load balancer to"
  type        = list(string)
}

variable "lb_enable_deletion_protection" {
  description = "Boolean to enable deletion protection on the load balancer"
  type        = bool
}

variable "environment" {
  description = "The environment tag to assign to the load balancer"
  type        = string
}

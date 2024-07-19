variable "lb_arn" {
  description = "The ARN of the load balancer"
  type        = string
}

variable "listener_port" {
  description = "The port on which the load balancer is listening"
  type        = number
}

variable "listener_protocol" {
  description = "The protocol for the load balancer listener"
  type        = string
}

variable "listener_default_action_type" {
  description = "The type of default action for the load balancer listener"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group"
  type        = string
}

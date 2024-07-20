variable "security_group_ids" {
  description = "List of security group IDs to apply the rule to"
  type        = list(string)
}

variable "type" {
  description = "Type of rule: ingress or egress"
  type        = string
}

variable "from_port" {
  description = "Starting port for the rule"
  type        = number
}

variable "to_port" {
  description = "Ending port for the rule"
  type        = number
}

variable "protocol" {
  description = "Protocol for the rule. Use -1 for all protocols"
  type        = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks to apply the rule to"
  type        = list(string)
}
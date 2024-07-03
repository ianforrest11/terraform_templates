variable "type" {
  description = "The type of rule, ingress or egress"
  type        = string
}

variable "from_port" {
  description = "The start port (or ICMP type number if protocol is icmp or icmpv6)"
  type        = number
}

variable "to_port" {
  description = "The end port (or ICMP code if protocol is icmp or icmpv6)"
  type        = number
}

variable "protocol" {
  description = "The protocol. If not icmp, icmpv6, tcp, udp, or all use the corresponding protocol number"
  type        = string
}

variable "security_group_id" {
  description = "The security group to apply this rule to"
  type        = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks"
  type        = list(string)
  default     = null
}

variable "ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR blocks"
  type        = list(string)
  default     = null
}

variable "prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints)"
  type        = list(string)
  default     = null
}

variable "source_security_group_id" {
  description = "Security group id to allow traffic from"
  type        = string
  default     = null
}

variable "self" {
  description = "If true, the security group itself will be added as a source to this ingress rule"
  type        = bool
  default     = null
}

variable "description" {
  description = "Description of this rule"
  type        = string
  default     = null
}

variable "cluster_name" {
  nullable = false
  type     = string
}

variable "cluster_version" {
  nullable = false
  type     = string
}

variable "eks_role_arn" {
  nullable = false
  type     = string
}

variable "eks_subnet_ids" {
  nullable = false
  type     = list(string)
}

variable "node_group_desired_capacity" {
  nullable = false
  type     = number
}

variable "node_group_ec2_key_pair" {
  nullable = false
  type     = string
}

variable "node_group_max_capacity" {
  nullable = false
  type     = number
}

variable "node_group_min_capacity" {
  nullable = false
  type     = number
}

variable "node_group_name" {
  nullable = false
  type     = string
}

variable "node_group_role_arn" {
  nullable = false
  type     = string
}

variable "node_group_subnet_ids" {
  nullable = false
  type     = list(string)
}

variable "node_instance_type" {
  nullable = false
  type     = string
}

variable "security_group_ids" {
  nullable = false
  type     = list(string)
}

variable "subnet_ids" {
  nullable = false
  type     = list(string)
}
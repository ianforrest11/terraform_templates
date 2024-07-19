variable "ami_id" {
  description = "AMI ID for the launch template"
  type        = string
}

variable "resource_type" {
  description = "resource type of launch template tags"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
}
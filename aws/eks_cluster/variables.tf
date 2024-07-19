variable "desired_size" {
  description = "The desired number of worker nodes in the EKS node group."
  nullable    = false
  type        = number
}

variable "ec2_ssh_key" {
  description = "The name of the EC2 key pair to use for SSH access to the worker nodes."
  nullable    = false
  type        = string
}

variable "environment" {
  description = "The environment for the EKS cluster (e.g., dev, prod)."
  nullable    = false
  type        = string
}

variable "instance_types" {
  description = "A list of instance types for the EKS node group."
  nullable    = false
  type        = list(string)
}

variable "max_size" {
  description = "The maximum number of worker nodes in the EKS node group."
  nullable    = false
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes in the EKS node group."
  nullable    = false
  type        = number
}

variable "name" {
  description = "The name of the EKS cluster."
  nullable    = false
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS node group."
  nullable    = false
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role to associate with the EKS node group."
  nullable    = false
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role to associate with the EKS cluster."
  nullable    = false
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EKS cluster."
  nullable    = false
  type        = list(string)
}

variable "node_security_groups" {
  description = "A list of security group IDs to associate with the node groups of an EKS cluster."
  nullable    = false
  type        = list(string)
}

variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the EKS cluster."
  nullable    = false
  type        = list(string)
}

variable "eks_version" {
  description = "The version of Kubernetes to use for the EKS cluster."
  nullable    = false
  type        = string
}

variable "image_id" {
  description = "id of ami image to use in eks node group launch template"
  nullable    = false
  type        = string
}

variable "resource_type" {
  description = "resource type of launch template tags"
  type        = string
}

variable "http_tokens" {
  description = "The state of token usage for your instance metadata requests. Use 'required' to enforce the use of IMDSv2."
  type        = string
  default     = "required"
}

variable "http_put_response_hop_limit" {
  description = "The desired HTTP PUT response hop limit for instance metadata requests."
  type        = number
  default     = 2
}
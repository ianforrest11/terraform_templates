variable "desired_capacity" {
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

variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the EKS cluster."
  nullable    = false
  type        = list(string)
}

variable "version" {
  description = "The version of Kubernetes to use for the EKS cluster."
  nullable    = false
  type        = string
}

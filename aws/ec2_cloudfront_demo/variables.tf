variable "ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t3_micro"
}

variable "subnet_id" {
  description = "Subnet ID for the bastion host"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the subnet is located"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the bastion host"
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "Name tag for the bastion host instance"
  type        = string
  default     = "hello-world-app"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the EKS cluster."
  nullable    = false
  type        = list(string)
}
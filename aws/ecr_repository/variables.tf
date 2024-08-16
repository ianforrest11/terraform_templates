variable "name" {
  description = "The name of the ECR Repository"
  nullable    = false
  type        = string
}

variable "force_delete" {
  description = "boolean to determine if ecr repo can be destroyed with or without images in it"
  type        = bool
  default     = false
}
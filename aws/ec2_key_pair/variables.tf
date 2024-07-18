variable "key_name" {
  description = "The name to assign to the SSH key pair"
  type        = string
  nullable    = false
}

variable "algorithm" {
  description = "The algorithm to use for the SSH key pair"
  type        = string
  default     = "RSA"
  nullable    = false
}

variable "rsa_bits" {
  description = "The number of bits for the RSA key"
  type        = number
  default     = 2048
  nullable    = false
}
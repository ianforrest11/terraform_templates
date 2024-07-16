variable "key_name" {
  description = "The name to assign to the SSH key pair"
  type        = string
  nullable    = false
}

variable "public_key" {
  description = "The public key material for the SSH key pair"
  type        = string
  nullable    = false
}

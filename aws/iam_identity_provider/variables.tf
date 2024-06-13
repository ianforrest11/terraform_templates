variable "identity_provider" {
  description = "A map of identity provider"
  type = map(object({
    client_id_list  = list(string)
    provider_url    = string
    thumbprint_list = list(string)
  }))
  default     = {}
}
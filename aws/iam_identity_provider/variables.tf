variable "identity_provider" {
  description = "Identity provider configuration"
  type = object({
    client_id_list  = list(string)
    provider_url    = string
    thumbprint_list = list(string)
  })
}
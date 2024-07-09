variable "roles" {
  description = "A map of roles to create with their respective policies"
  type = map(object({
    assume_role_policy_name = string
    environment = string
    name = string
    policies   = list(string)
    purpose = string
  }))
  default     = {}
}

variable "policies" {
  description = "A map of policy names to ARNs"
  type = map(string)
}
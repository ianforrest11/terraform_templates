variable "users" {
  description = "A map of users to create with their respective policies"
  type = map(object({
    first_name = string
    last_name  = string
    team       = string
    username   = string
    policies   = list(string)
  }))
  default     = {}
}
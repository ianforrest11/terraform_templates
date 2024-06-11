variable "users" {
  description = "A map of users to create with their respective policies"
  type = map(object({
    first_name = string
    last_name  = string
    username   = string
    team       = string
    policies   = list(string)
  }))
  default     = {}
}
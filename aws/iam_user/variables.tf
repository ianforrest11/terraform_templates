variable "users" {
  description = "A map of users to create with their respective policies and groups"
  type = map(object({
    first_name = string
    groups     = list(string)
    last_name  = string
    policies   = list(string)
    username   = string
    team       = string
  }))
  default     = {}
}
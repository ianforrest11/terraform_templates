variable "groups" {
  description = "A map of groups to create with their respective policies"
  type = map(object({
    policies   = list(string)
    group_name = string
  }))
  default     = {}
}
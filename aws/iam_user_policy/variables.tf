variable "twofa_policy_name" {
  default  = "two-fa-iam-policy"
  nullable = false
  type     = string
}

variable "master_policy_name" {
  default  = "master-iam-policy"
  nullable = false
  type     = string
}

variable "readonly_policy_name" {
  default  = "readonly-iam-policy"
  nullable = false
  type     = string
}
variable "origin_domain" {
  description = "The origin domain (public DNS)"
  type        = string
}

variable "origin_protocol_policy" {
  description = "The protocol to use"
  type        = string
  default     = "http-only"
}

variable "http_port" {
  description = "The port to use for the http protocol"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "The port to use for the https protocol"
  type        = number
  default     = 443
}

variable "origin_name" {
  description = "The origin name"
  type        = string
}

variable "compress_objects" {
  description = "Whether to automatically compress objects"
  type        = bool
  default     = false
}

variable "allowed_http_methods" {
  description = "Allowed HTTP methods"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cache_policy_id" {
  description = "Cache policy ID to use origin cache control headers"
  type        = string
  default     = "658327ea-f89d-4fab-a63d-7e88639e58f6" # AWS managed cache policy ID for 'Use Origin Cache Headers'
}

variable "origin_request_policy_id" {
  description = "Origin request policy ID for all viewer"
  type        = string
  default     = "b689b0a8-53d0-40ab-baf2-68738e2966ac" # AWS managed origin request policy ID for 'All Viewer'
}

variable "price_class" {
  description = "The price class for the distribution"
  type        = string
  default     = "PriceClass_100" # Use only North America and Europe
}

variable "supported_http_versions" {
  description = "Supported HTTP versions"
  type        = string
  default     = "http2and3"
}

variable "logging_bucket" {
  description = "The S3 bucket for standard logging"
  type        = string
}

variable "logging_prefix" {
  description = "The logging prefix for standard logging"
  type        = string
  default     = "logs/"
}

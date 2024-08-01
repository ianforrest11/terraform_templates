resource "aws_cloudfront_distribution" "example" {
  origin {
    domain_name = var.origin_domain
    origin_id   = var.origin_name

    custom_origin_config {
      http_port              = var.http_port
      https_port             = var.https_port
      origin_protocol_policy = var.origin_protocol_policy
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = false
  price_class         = var.price_class

  default_cache_behavior {
    target_origin_id       = var.origin_name
    viewer_protocol_policy = "allow-all"

    allowed_methods = var.allowed_http_methods
    cached_methods  = ["GET", "HEAD"]

    cache_policy_id             = var.cache_policy_id
    origin_request_policy_id    = var.origin_request_policy_id
    compress                    = var.compress_objects
    smooth_streaming            = false
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  logging_config {
    include_cookies = false
    bucket          = var.logging_bucket
    prefix          = var.logging_prefix
  }

  http_version = var.supported_http_versions

  tags = {
    Name = var.origin_name
  }
}

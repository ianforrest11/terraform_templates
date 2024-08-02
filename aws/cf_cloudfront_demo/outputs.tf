output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.example.domain_name
}
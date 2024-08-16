output "ecr_cloudfront_demo_repository_id" {
  description = "The repository ID of the ECR repository"
  value       = aws_ecr_repository.ecr_cloudfront_demo.registry_id
}
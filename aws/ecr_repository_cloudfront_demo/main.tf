resource "aws_ecr_repository" "ecr_cloudfront_demo" {
  name                 = var.name
  force_delete         = var.force_delete  
}

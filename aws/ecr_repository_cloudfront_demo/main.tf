resource "aws_ecr_repository" "foo" {
  name                 = var.name
  force_delete         = var.force_delete  
}

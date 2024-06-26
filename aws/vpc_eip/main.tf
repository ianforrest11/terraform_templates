resource "aws_eip" "this" {
  vpc = var.vpc
  tags = {
    Name = var.name
  }
}
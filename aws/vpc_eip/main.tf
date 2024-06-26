resource "aws_eip" "lb" {
  vpc = var.vpc
  tags = {
    Name = var.name
  }
}
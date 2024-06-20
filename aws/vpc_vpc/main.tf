resource "aws_vpc" "this" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name        = var.name
  }
}
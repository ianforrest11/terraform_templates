resource "aws_route_table" "this" {
  count = length(var.subnets)
  vpc_id = var.vpc_id
  tags = {
    Name = var.name
    Type = var.type
  }
}
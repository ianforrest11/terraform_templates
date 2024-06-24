resource "aws_nat_gateway" "this" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id # Place NAT Gateway in the first public subnet
  tags = {
    Name = var.name
  }
}
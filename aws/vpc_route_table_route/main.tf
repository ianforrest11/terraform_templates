resource "aws_route" "this" {
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id
  nat_gateway_id         = var.nat_gateway_id
  route_table_id         = var.route_table_id
}

resource "aws_route_table_association" "this" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}
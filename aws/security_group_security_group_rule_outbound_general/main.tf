resource "aws_security_group_rule" "this" {
  for_each = toset(var.security_group_ids)
  type              = var.type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = each.key
}
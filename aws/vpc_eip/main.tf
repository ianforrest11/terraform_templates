resource "aws_eip" "lb" {
  domain   = var.domain
  tags = {
    Name = var.name
  }
}
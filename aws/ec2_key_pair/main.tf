resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.my_key_pair.public_key_openssh
}

resource "tls_private_key" "my_key_pair" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}
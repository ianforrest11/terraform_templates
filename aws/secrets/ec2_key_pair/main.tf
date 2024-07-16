# Generate an SSH key pair
resource "tls_private_key" "this" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

# Store the private key in AWS Secrets Manager
resource "aws_secretsmanager_secret" "this_private" {
  name = "${var.secret_name_prefix}_private"
}

resource "aws_secretsmanager_secret_version" "this_private" {
  secret_id     = aws_secretsmanager_secret.this_private.id
  secret_string = tls_private_key.this.private_key_pem
}

# Store the public key in AWS Secrets Manager
resource "aws_secretsmanager_secret" "this_public" {
  name = "${var.secret_name_prefix}_public"
}

resource "aws_secretsmanager_secret_version" "this_public" {
  secret_id     = aws_secretsmanager_secret.this_public.id
  secret_string = tls_private_key.this.public_key_openssh
}
resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  tags = {
    Name         = var.instance_name
    Environment  = var.environment
  }
  security_groups = [aws_security_group.bastion_sg.name]
}

resource "aws_security_group" "bastion_sg" {
  name        = "${var.environment}_bastion_sg"
  description = "Security group ${var.environment} for bastion host"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}_bastion_sg"
  }
}
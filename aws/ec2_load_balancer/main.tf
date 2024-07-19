resource "aws_lb" "example" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets
  enable_deletion_protection = var.lb_enable_deletion_protection

  tags = {
    Environment = var.environment
  }
}


resource "aws_eks_cluster" "this" {
  name      = var.name
  role_arn  = var.role_arn
  version   = var.eks_version
  
  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  
  scaling_config {
    desired_size  = var.desired_size
    max_size      = var.max_size
    min_size      = var.min_size
  }
  
  instance_types  = var.instance_types
  
  remote_access {
    ec2_ssh_key   = var.ec2_ssh_key
    source_security_group_ids = var.source_security_group_ids
  }

  tags = {
    Name        = var.node_group_name
    Environment = var.environment
  }
}

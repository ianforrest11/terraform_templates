resource "aws_eks_cluster" "this" {
  name      = var.cluster_name
  role_arn  = var.eks_role_arn
  version   = var.cluster_version
  vpc_config {
    subnet_ids         = var.eks_subnet_ids
    security_group_ids = var.security_group_ids
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.node_group_subnet_ids

  scaling_config {
    desired_size  = var.node_group_desired_capacity
    max_size      = var.node_group_max_capacity
    min_size      = var.node_group_min_capacity
  }

  instance_types  = [var.node_instance_type]

  remote_access {
    ec2_ssh_key   = var.node_group_ec2_key_pair
  }
}
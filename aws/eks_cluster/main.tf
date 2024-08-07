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

resource "aws_launch_template" "this" {
  name_prefix   = "${var.node_group_name}_"
  image_id      = var.image_id  # Specify the AMI ID or use a data source to fetch the latest AMI
  key_name      = var.ec2_ssh_key
  tag_specifications {
    resource_type = var.resource_type
    tags = {
      Name        = "${var.node_group_name}_instance"
      Environment = var.environment
    }
  }
  metadata_options {
    http_tokens                 = var.http_tokens
    http_put_response_hop_limit = var.http_put_response_hop_limit
  }
  network_interfaces {
    security_groups = var.node_security_groups
  }
  lifecycle {
    create_before_destroy = true
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
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
  tags = {
    Name        = var.node_group_name
    Environment = var.environment
  }
}

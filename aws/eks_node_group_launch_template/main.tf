resource "aws_launch_template" "this" {
  name_prefix   = "${var.node_group_name}-"
  image_id      = var.ami_id  # Specify the AMI ID or use a data source to fetch the latest AMI

  tag_specifications {
    resource_type = var.resource_type
    tags = {
      Name        = "${var.node_group_name}-instance"
      Environment = var.environment
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
output "ec2_cloudfront_demo_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2_cloudfront_demo.public_ip
}

output "ec2_cloudfront_demo_instance_id" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2_cloudfront_demo.id
}
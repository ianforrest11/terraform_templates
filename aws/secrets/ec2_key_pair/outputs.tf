output "key_name" {
  description = "The name of the SSH key pair"
  value       = aws_key_pair.this.key_name
}

output "key_fingerprint" {
  description = "The fingerprint of the SSH key pair"
  value       = aws_key_pair.this.key_fingerprint
}

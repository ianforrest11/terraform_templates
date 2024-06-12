output "this_master_policy_arn" {
  description = "The ARN of the IAM policy"
  value       = aws_iam_policy.this.arn
}
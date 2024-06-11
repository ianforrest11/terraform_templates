output "this_master_policy_arn" {
  description = "The ARN of the IAM policy for this_master"
  value       = aws_iam_policy.this_master.arn
}

output "this_2fa_policy_arn" {
  description = "The ARN of the IAM policy for this_2fa"
  value       = aws_iam_policy.this_2fa.arn
}
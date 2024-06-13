resource "aws_iam_policy" "this" {
  name = var.policy_name
  policy = file("${path.module}/json/${var.policy_name}.json")
}
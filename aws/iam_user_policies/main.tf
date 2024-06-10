resource "aws_iam_policy" "this_master" {
  name = var.master_policy_name
  policy = file("${path.module}/json/master.json")
}

resource "aws_iam_policy" "this_readonly" {
  name = var.readonly_policy_name
  policy = file("${path.module}/json/read_only.json")
}

resource "aws_iam_policy" "this_2fa" {
  name = var.twofa_policy_name
  policy = file("${path.module}/json/2fa.json")
}
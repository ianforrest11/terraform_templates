resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:*"]
    resources = [
      "${aws_s3_bucket.example.arn}/*",
      aws_s3_bucket.example.arn,
    ]

    principals {
      type        = "AWS"
      identifiers = [var.user_arn]
    }
  }

  statement {
    actions = ["s3:GetObject"]
    resources = [
      "${aws_s3_bucket.example.arn}/*",
    ]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
  }
}

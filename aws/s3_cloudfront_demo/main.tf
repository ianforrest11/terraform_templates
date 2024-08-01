resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_name
  }
  acl = "log-delivery-write"
  depends_on = [aws_s3_bucket_ownership_controls.example]
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.bucket

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  policy = templatefile("${path.module}/policy.json", {
    bucket_arn     = aws_s3_bucket.example.arn,
    user_arn       = var.user_arn
  })
}

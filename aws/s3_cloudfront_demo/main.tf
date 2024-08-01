resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  policy = templatefile("${path.module}/policy.json", {
    bucket_arn = aws_s3_bucket.example.arn
    user_arn   = var.user_arn
  })
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "log-delivery-write"
}
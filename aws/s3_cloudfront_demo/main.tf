resource "aws_s3_bucket" "ec2_cloudfront_demo" {
  bucket = var.bucket_name
  force_destroy  = var.force_destroy
  tags = var.bucket_tags
}

resource "aws_s3_bucket_logging" "ec2_cloudfront_demo" {
  bucket        = aws_s3_bucket.ec2_cloudfront_demo.id
  target_bucket = aws_s3_bucket.ec2_cloudfront_demo.id
  target_prefix = var.target_prefix
}

resource "aws_s3_bucket_policy" "ec2_cloudfront_demo" {
  bucket = aws_s3_bucket.ec2_cloudfront_demo.id

  policy = templatefile("${path.module}/s3_policy.json", {
    bucket_name      = var.bucket_name
    aws_account_id   = var.aws_account_id
  })
}

resource "aws_s3_bucket_acl" "ec2_cloudfront_demo" {
  bucket = aws_s3_bucket.ec2_cloudfront_demo.id

  access_control_policy {
    owner {
      display_name = var.owner_display_name
      id           = var.owner_id
    }

    grant {
      grantee {
        id   = var.grantee_id
        type = "CanonicalUser"
        uri  = var.grantee_uri
      }
      permission = "FULL_CONTROL"
    }
  }
}
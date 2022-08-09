# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A S3 BUCKET FOR STORE STATIC SITE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_s3_bucket" "s3_origin" {
  bucket = lower("s3-${var.project}-${var.environment}-${var.s3_cloudfront_name}")
  tags = {
    "Manager" = var.manager
  }
}
resource "aws_s3_bucket_policy" "s3_origin_policy" {
  bucket = aws_s3_bucket.s3_origin.id
  policy = <<POLICY
{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${var.cloudfront_origin_access_id}"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.s3_origin.id}/*"
        }
    ]
}
POLICY
}
resource "aws_s3_bucket_public_access_block" "s3_origin_access" {
  bucket = aws_s3_bucket.s3_origin.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

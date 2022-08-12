output "s3_bucket_id" {
  value       = aws_s3_bucket.s3_origin.id
  description = "ID S3 for Cloudfront"
}

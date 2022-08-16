output "cloudfront_origin_access_id" {
  value       = aws_cloudfront_origin_access_identity.cloudfront_origin_access.id
  description = "Id of origin accedd identity"
}

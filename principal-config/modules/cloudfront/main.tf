# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A CLOUDFRONT ORIGIN ACCESS IDENTITY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_cloudfront_origin_access_identity" "cloudfront_origin_access" {
  comment = lower("access-identity-s3-${var.project}-${var.environment}-${var.s3_cloudfront_name}.s3.us-east-1.amazonaws.com")
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A CLOUDFRONT ORIGIN
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

data "aws_cloudfront_cache_policy" "cloudfront_data" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${var.s3_bucket_id}.s3.us-east-1.amazonaws.com"
    origin_id   = var.s3_bucket_id
    
    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.cloudfront_origin_access.id}"
    }
  }

  enabled = true
  comment = "Cloudfront-${var.project}-${var.environment}-${var.s3_cloudfront_name}"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.s3_bucket_id
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id = data.aws_cloudfront_cache_policy.cloudfront_data.id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    var.s3_bucket_id
  ]
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = ""
}

variable "project" {
  description = "Project name"
  type        = string
  default     = ""
}

variable "s3_cloudfront_name" {
  description = "S3 cloudfront name"
  type        = string
  default     = ""
}

variable "s3_bucket_id" {
  description = "ID S3 for Cloudfront"
  type        = string
  default     = ""
}

variable "manager" {
  description = "Deployder"
  type        = string
  default     = ""
}

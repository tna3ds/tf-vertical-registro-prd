variable "s3_cloudfront_name" {
  description = "S3 cloudfront name"
  type        = string
  default     = ""
}

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

variable "manager" {
  description = "Deployder"
  type        = string
  default     = ""
}

variable "cloudfront_origin_access_id" {
  description = "Id of origin accedd identity"
  type        = string
  default     = ""
}

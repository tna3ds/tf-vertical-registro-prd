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

variable "vpc_id" {
  description = "ARN VPC"
  type        = string
  default     = ""
}

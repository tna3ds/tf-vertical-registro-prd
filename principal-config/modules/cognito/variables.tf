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

variable "dns" {
  description = "DNS name"
  type        = string
  default     = ""
}

variable "cognito_callback_urls_name" {
  description = "cognito callback name"
  type        = string
  default     = ""
}

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

variable "public_subnets" {
  description = "List of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "List of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "azs" {
  description = "List of availability zones in the region"
  type        = list(string)
  default     = []
}

variable "azs_name" {
  description = "List names of availability zones in the region"
  type        = list(string)
  default     = []
}

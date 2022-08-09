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

variable "sg_alb_id" {
  description = "id of the SG alb"
  type        = string
  default     = ""
}

variable "private_subnets_id" {
  description = "id of the private subnets"
  type        = list(string)
  default     = []
}

variable "aws_region" {
  description = "AWS Region"
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

variable "vpc_id" {
  description = "ID VPC"
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

variable "repositories" {
  description = "List names of ecr repositories"
  type        = list(string)
  default     = []
}

variable "s3_cloudfront_name" {
  description = "S3 cloudfront name"
  type        = string
  default     = ""
}

variable "dns" {
  description = "DNS name"
  type        = string
  default     = ""
}

variable "ecs_task_role_policies_name" {
  description = "List arn policies for ecs taks"
  type        = list(string)
  default     = []
}

variable "ecs_task_auth_policies_name" {
  description = "List arn policies for ecs taks"
  type        = list(string)
  default     = []
}

variable "ecs_task_catalogo_policies_name" {
  description = "List arn policies for ecs taks"
  type        = list(string)
  default     = []
}

variable "ecs_task_persistence_policies_name" {
  description = "List arn policies for ecs taks"
  type        = list(string)
  default     = []
}

variable "ecs_task_registro-workflow_policies_name" {
  description = "List arn policies for ecs taks"
  type        = list(string)
  default     = []
}

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

variable "repositories" {
  description = "List names of ecr repositories"
  type        = list(string)
  default     = []
}

variable "execution_role_arn" {
  description = "ARN of execution role for task ejecution"
  type        = string
  default     = ""
}

variable "task_roles_arn" {
  description = "ARN for all services"
  type        = list(string)
  default     = []
}

variable "tag_image_auth" {
  description = "Image tag for auth services"
  type        = string
  default     = ""
}

variable "tag_image_catalogo" {
  description = "Image tag for catalogo services"
  type        = string
  default     = ""
}

variable "tag_image_persistence" {
  description = "Image tag for persistence services"
  type        = string
  default     = ""
}

variable "tag_image_registro_workflow" {
  description = "Image tag for registro-workflow services"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "ID VPC"
  type        = string
  default     = ""
}

variable "private_subnets_id" {
  description = "List of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "auth_listener_port" {
  description = "Number port for target group auth service"
  type        = number
  default     = 0
}

variable "auth_service_port" {
  description = "Number port for target group auth service"
  type        = number
  default     = 0
}

variable "auth_health_check_path" {
  description = "health check for target group auth service"
  type        = string
  default     = ""
}

variable "catalogo_listener_port" {
  description = "Number port for target group catalogo service"
  type        = number
  default     = 0
}

variable "catalogo_service_port" {
  description = "Number port for target group catalogo service"
  type        = number
  default     = 0
}

variable "catalogo_health_check_path" {
  description = "health check for target group catalogo service"
  type        = string
  default     = ""
}

variable "persistence_listener_port" {
  description = "Number port for target group persistence service"
  type        = number
  default     = 0
}

variable "persistence_service_port" {
  description = "Number port for target group persistence service"
  type        = number
  default     = 0
}

variable "persistence_health_check_path" {
  description = "health check for target group persistence service"
  type        = string
  default     = ""
}

variable "registro_workflow_listener_port" {
  description = "Number port for target group registro-workflow service"
  type        = number
  default     = 0
}

variable "registro_workflow_service_port" {
  description = "Number port for target group registro-workflow service"
  type        = number
  default     = 0
}

variable "registro_workflow_health_check_path" {
  description = "health check for target group registro-workflow service"
  type        = string
  default     = ""
}

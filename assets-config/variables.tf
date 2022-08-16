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

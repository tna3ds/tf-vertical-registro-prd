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

variable "ecs_auth_name" {
  description = "The name of ecs auth services"
  type        = string
  default     = ""
}

variable "auth_up_arn" {
  description = "The arn of asg up auth services"
  type        = string
  default     = ""
}

variable "auth_down_arn" {
  description = "The arn of asg down auth services"
  type        = string
  default     = ""
}

variable "ecs_catalogo_name" {
  description = "The name of ecs catalogo services"
  type        = string
  default     = ""
}

variable "catalogo_up_arn" {
  description = "The arn of asg up catalogo services"
  type        = string
  default     = ""
}

variable "catalogo_down_arn" {
  description = "The arn of asg down catalogo services"
  type        = string
  default     = ""
}

variable "ecs_persistence_name" {
  description = "The name of ecs persistence services"
  type        = string
  default     = ""
}

variable "persistence_up_arn" {
  description = "The arn of asg up persistence services"
  type        = string
  default     = ""
}

variable "persistence_down_arn" {
  description = "The arn of asg down persistence services"
  type        = string
  default     = ""
}

variable "ecs_registro_workflow_name" {
  description = "The name of ecs registro-workflow services"
  type        = string
  default     = ""
}

variable "registro_workflow_up_arn" {
  description = "The arn of asg up registro-workflow services"
  type        = string
  default     = ""
}

variable "registro_workflow_down_arn" {
  description = "The arn of asg down registro-workflow services"
  type        = string
  default     = ""
}

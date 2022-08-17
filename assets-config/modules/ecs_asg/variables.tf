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

variable "auth_min_task" {
  description = "number of min task for auth service"
  type        = number
  default     = 0
}

variable "auth_max_task" {
  description = "number of max task for auth service"
  type        = number
  default     = 0
}

variable "ecs_catalogo_name" {
  description = "The name of ecs catalogo services"
  type        = string
  default     = ""
}

variable "catalogo_min_task" {
  description = "number of min task for catalogo service"
  type        = number
  default     = 0
}

variable "catalogo_max_task" {
  description = "number of max task for catalogo service"
  type        = number
  default     = 0
}

variable "ecs_persistence_name" {
  description = "The name of ecs persistence services"
  type        = string
  default     = ""
}

variable "persistence_min_task" {
  description = "number of min task for persistence service"
  type        = number
  default     = 0
}

variable "persistence_max_task" {
  description = "number of max task for persistence service"
  type        = number
  default     = 0
}

variable "ecs_registro_workflow_name" {
  description = "The name of ecs registro-workflow services"
  type        = string
  default     = ""
}

variable "registro_workflow_min_task" {
  description = "number of min task for registro-workflow service"
  type        = number
  default     = 0
}

variable "registro_workflow_max_task" {
  description = "number of max task for registro-workflow service"
  type        = number
  default     = 0
}

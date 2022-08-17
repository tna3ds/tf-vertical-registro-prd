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

variable "private_subnets_id" {
  description = "List of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "auth_service_port" {
  description = "Number port for target group auth service"
  type        = number
  default     = 0
}

variable "target_auth_service_arn" {
  description = "The arn of the target group auth services"
  type        = string
  default     = ""
}

variable "task_definitions_auth_service_arn" {
  description = "The arn of the task definitions auth services"
  type        = string
  default     = ""
}

variable "catalogo_service_port" {
  description = "Number port for target group catalogo service"
  type        = number
  default     = 0
}

variable "target_catalogo_service_arn" {
  description = "The arn of the task definitions catalogo services"
  type        = string
  default     = ""
}

variable "task_definitions_catalogo_service_arn" {
  description = "The arn of the task definitions catalogo services"
  type        = string
  default     = ""
}

variable "persistence_service_port" {
  description = "Number port for target group persistence service"
  type        = number
  default     = 0
}

variable "target_persistence_service_arn" {
  description = "The arn of the task definitions persistence services"
  type        = string
  default     = ""
}

variable "task_definitions_persistence_service_arn" {
  description = "The arn of the task definitions persistence services"
  type        = string
  default     = ""
}

variable "registro_workflow_service_port" {
  description = "Number port for target group registro-workflow service"
  type        = number
  default     = 0
}

variable "target_registro_workflow_service_arn" {
  description = "The arn of the task definitions registro-workflow services"
  type        = string
  default     = ""
}

variable "task_definitions_registro_workflow_service_arn" {
  description = "The arn of the task definitions registro-workflow services"
  type        = string
  default     = ""
}

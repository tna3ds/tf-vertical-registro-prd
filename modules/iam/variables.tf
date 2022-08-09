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

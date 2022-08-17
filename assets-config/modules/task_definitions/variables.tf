variable "manager" {
  description = "Deployder"
  type        = string
  default     = ""
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

variable "repositories" {
  description = "List names of ecr repositories"
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

variable "auth_capacity" {
  description = "Capacity for auth services"
  type        = list(string)
  default     = []
}

variable "auth_service_port" {
  description = "Number port for target group auth service"
  type        = number
  default     = 0
}

variable "auth_vCPU" {
  description = "vCpu for taskdefinition auth service"
  type        = number
  default     = 0
}

variable "auth_ram" {
  description = "ram for taskdefinition auth service"
  type        = number
  default     = 0
}

variable "catalogo_vCPU" {
  description = "vCpu for taskdefinition catalogo service"
  type        = number
  default     = 0
}

variable "catalogo_ram" {
  description = "ram for taskdefinition catalogo service"
  type        = number
  default     = 0
}

variable "persistence_vCPU" {
  description = "vCpu for taskdefinition persistence service"
  type        = number
  default     = 0
}

variable "persistence_ram" {
  description = "ram for taskdefinition persistence service"
  type        = number
  default     = 0
}

variable "registro_workflow_vCPU" {
  description = "vCpu for taskdefinition registro-workflow service"
  type        = number
  default     = 0
}

variable "registro_workflow_ram" {
  description = "ram for taskdefinition registro-workflow service"
  type        = number
  default     = 0
}

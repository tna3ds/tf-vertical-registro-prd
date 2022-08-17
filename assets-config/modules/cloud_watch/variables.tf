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

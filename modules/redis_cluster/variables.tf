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

variable "sg_redis_id" {
  description = "id of the SG redis"
  type        = string
  default     = ""
}

variable "private_subnets_id" {
  description = "id of the private subnets"
  type        = list(string)
  default     = []
}

variable "redis_slow_logs_name" {
  description = "The name of cloudwatch logs for redis slow"
  type        = string
  default     = ""
}

variable "redis_engine_logs_name" {
  description = "The name of cloudwatch logs for redis engine"
  type        = string
  default     = ""
}

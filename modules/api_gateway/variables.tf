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

variable "dns" {
  description = "DNS name"
  type        = string
  default     = ""
}

variable "cognito_user_pool_endpoint" {
  description = "The endpoint of the congito user pool"
  type        = string
  default     = ""
}

variable "cognito_user_pool_autorizer_id" {
  description = "The id of the congito pool cliente"
  type        = string
  default     = ""
}

variable "alb_priv_name" {
  description = "The name of alb priv"
  type        = string
  default     = ""
}

variable "sg_alb_id" {
  description = "id of the SG alb"
  type        = string
  default     = ""
}

variable "private_subnets_id" {
  description = "id of the private subnets"
  type        = list(string)
  default     = []
}

variable "lister_alb_priv_arn" {
  description = "The arn of lister alb priv"
  type       = string
  default     = ""
}

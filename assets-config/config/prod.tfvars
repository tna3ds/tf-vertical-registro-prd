#PROJECT DETAILS
aws_region  = "us-east-2"
environment = "prd"
project     = "cn"
manager     = "Terraform"

repositories = [
  "auth",
  "catalogo",
  "persistence",
  "registro-workflow"
]

vpc_id = "vpc-09ca485f0eb46cc98"

private_subnets_id = [
  "subnet-077e44c5227788482",
  "subnet-0c7f77e586069802f",
  "subnet-01eee0b45fac7f413"
]

#ROLE
execution_role_arn = "ecsTaskExecutionRole"

#TAG OF IMAGES
tag_image_auth              = "latest"
tag_image_catalogo          = "latest"
tag_image_persistence       = "latest"
tag_image_registro_workflow = "latest"

#SERVICES
#@auth
auth_listener_port     = 81
auth_service_port      = 80
auth_health_check_path = "/"
auth_vCPU              = 2048
auth_ram               = 4096
auth_desired_task      = 3
auth_min_task          = 1
auth_max_task          = 6

#@catalogo
catalogo_listener_port     = 82
catalogo_service_port      = 80
catalogo_health_check_path = "/"
catalogo_vCPU              = 2048
catalogo_ram               = 4096
catalogo_desired_task      = 3
catalogo_min_task          = 1
catalogo_max_task          = 6

#@persistence
persistence_listener_port     = 83
persistence_service_port      = 80
persistence_health_check_path = "/"
persistence_vCPU              = 2048
persistence_ram               = 4096
persistence_desired_task      = 3
persistence_min_task          = 1
persistence_max_task          = 6

#@registro-workflow
registro_workflow_listener_port     = 84
registro_workflow_service_port      = 80
registro_workflow_health_check_path = "/"
registro_workflow_vCPU              = 2048
registro_workflow_ram               = 4096
registro_workflow_desired_task      = 3
registro_workflow_min_task          = 1
registro_workflow_max_task          = 6

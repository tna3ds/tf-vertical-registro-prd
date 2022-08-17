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
  "subnet-0603943f88d6d54bb",
  "subnet-099e2c98ff2b94532",
  "subnet-089d8491dc9c5c815"
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
/*auth_vCPU = 2048
auth_ram = 4096
auth_desired_task = 3*/

#@catalgo
catalogo_listener_port     = 82
catalogo_service_port      = 80
catalogo_health_check_path = "/"

#@persistence
persistence_listener_port     = 83
persistence_service_port      = 80
persistence_health_check_path = "/"

#@registro-workflow
registro_workflow_listener_port     = 84
registro_workflow_service_port      = 80
registro_workflow_health_check_path = "/"

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

#ROLE
execution_role_arn = "ecsTaskExecutionRole"

#TAG OF IMAGES
tag_image_auth              = "latest"
tag_image_catalogo          = "latest"
tag_image_persistence       = "latest"
tag_image_registro_workflow = "latest"

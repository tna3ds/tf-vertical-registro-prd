# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TASK DEFINITION FOR AUTH SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_ecs_task_definition" "task_definition_auth_services" {
  family                   = "bk-${var.repositories[0]}-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.auth_vCPU
  memory                   = var.auth_ram
  execution_role_arn       = data.aws_iam_role.execution_role_arn_data.arn
  task_role_arn            = data.aws_iam_role.task_role_arn_data.*.arn[0]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "bk-${var.repositories[0]}-service",
    "image": "${data.aws_ecr_repository.ecr_repositories_data.*.repository_url[0]}:${var.tag_image_auth}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.auth_service_port},
        "hostPort": ${var.auth_service_port},
        "protocol": "tcp"
      }
    ]
  }
]
TASK_DEFINITION
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TASK DEFINITION FOR CATALOGO SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_ecs_task_definition" "task_definition_catalogo_services" {
  family                   = "bk-${var.repositories[1]}-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.catalogo_vCPU
  memory                   = var.catalogo_ram
  execution_role_arn       = data.aws_iam_role.execution_role_arn_data.arn
  task_role_arn            = data.aws_iam_role.task_role_arn_data.*.arn[1]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "bk-${var.repositories[1]}-service",
    "image": "${data.aws_ecr_repository.ecr_repositories_data.*.repository_url[1]}:${var.tag_image_catalogo}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.auth_service_port},
        "hostPort": ${var.auth_service_port},
        "protocol": "tcp"
      }
    ]
  }
]
TASK_DEFINITION
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TASK DEFINITION FOR PERSISTENCE SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_ecs_task_definition" "task_definition_persistence_services" {
  family                   = "bk-${var.repositories[2]}-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.persistence_vCPU
  memory                   = var.persistence_ram
  execution_role_arn       = data.aws_iam_role.execution_role_arn_data.arn
  task_role_arn            = data.aws_iam_role.task_role_arn_data.*.arn[2]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "bk-${var.repositories[2]}-service",
    "image": "${data.aws_ecr_repository.ecr_repositories_data.*.repository_url[2]}:${var.tag_image_persistence}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.auth_service_port},
        "hostPort": ${var.auth_service_port},
        "protocol": "tcp"
      }
    ]
  }
]
TASK_DEFINITION
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TASK DEFINITION FOR REGISTRO WORKFLOW SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_ecs_task_definition" "task_definition_registro_workflow_services" {
  family                   = "bk-${var.repositories[3]}-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.registro_workflow_vCPU
  memory                   = var.registro_workflow_ram
  execution_role_arn       = data.aws_iam_role.execution_role_arn_data.arn
  task_role_arn            = data.aws_iam_role.task_role_arn_data.*.arn[3]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "bk-${var.repositories[3]}-service",
    "image": "${data.aws_ecr_repository.ecr_repositories_data.*.repository_url[3]}:${var.tag_image_registro_workflow}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.auth_service_port},
        "hostPort": ${var.auth_service_port},
        "protocol": "tcp"
      }
    ]
  }
]
TASK_DEFINITION
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ECS/ASG+ AUTH SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#SERVICE
resource "aws_ecs_service" "ecs_auth_services" {
  name            = "bk-${var.repositories[0]}-service"
  cluster         = data.aws_ecs_cluster.ecs_cluster_data.id
  task_definition = var.task_definitions_auth_service_arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [data.aws_security_group.sg_ecs_data.id]
    subnets          = data.aws_subnet.private_subnets_data.*.id
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_auth_service_arn
    container_name   = "bk-${var.repositories[0]}-service"
    container_port   = var.auth_service_port
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ECS/ASG+ CATALOGO SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#SERVICE
resource "aws_ecs_service" "ecs_catalogo_services" {
  name            = "bk-${var.repositories[1]}-service"
  cluster         = data.aws_ecs_cluster.ecs_cluster_data.id
  task_definition = var.task_definitions_catalogo_service_arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [data.aws_security_group.sg_ecs_data.id]
    subnets          = data.aws_subnet.private_subnets_data.*.id
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_catalogo_service_arn
    container_name   = "bk-${var.repositories[1]}-service"
    container_port   = var.catalogo_service_port
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ECS/ASG+ PERSISTENCE SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#SERVICE
resource "aws_ecs_service" "ecs_persistence_services" {
  name            = "bk-${var.repositories[2]}-service"
  cluster         = data.aws_ecs_cluster.ecs_cluster_data.id
  task_definition = var.task_definitions_persistence_service_arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [data.aws_security_group.sg_ecs_data.id]
    subnets          = data.aws_subnet.private_subnets_data.*.id
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_persistence_service_arn
    container_name   = "bk-${var.repositories[2]}-service"
    container_port   = var.persistence_service_port
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ECS/ASG+ REGISTRO WORKFLOW SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#SERVICE
resource "aws_ecs_service" "ecs_registro_workflow_services" {
  name            = "bk-${var.repositories[3]}-service"
  cluster         = data.aws_ecs_cluster.ecs_cluster_data.id
  task_definition = var.task_definitions_registro_workflow_service_arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [data.aws_security_group.sg_ecs_data.id]
    subnets          = data.aws_subnet.private_subnets_data.*.id
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_registro_workflow_service_arn
    container_name   = "bk-${var.repositories[3]}-service"
    container_port   = var.registro_workflow_service_port
  }

  tags = {
    "Manager" = var.manager
  }
}

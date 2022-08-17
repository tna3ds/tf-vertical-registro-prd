terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16.0"
    }
  }

  required_version = ">= 1.0.0"
  backend "s3" {
    // Before apply please check the backend config file
  }
}

provider "aws" {
  region = var.aws_region
}

provider "docker" {
  registry_auth {
    address  = local.aws_ecr_url
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }
}

resource "docker_registry_image" "backend" {
  count = length(var.repositories)
  name  = element(data.aws_ecr_repository.ecr_repositories_data.*.repository_url, count.index)

  build {
    context = "${path.cwd}/docker"
  }
}

module "task_definitions" {
  manager                     = var.manager
  execution_role_arn          = var.execution_role_arn
  task_roles_arn              = var.task_roles_arn
  repositories                = var.repositories
  tag_image_auth              = var.tag_image_auth
  tag_image_catalogo          = var.tag_image_catalogo
  tag_image_persistence       = var.tag_image_persistence
  tag_image_registro_workflow = var.tag_image_registro_workflow
  auth_service_port           = var.auth_service_port
  auth_vCPU                   = var.auth_vCPU
  auth_ram                    = var.auth_ram
  catalogo_vCPU               = var.catalogo_vCPU
  catalogo_ram                = var.catalogo_ram
  persistence_vCPU            = var.persistence_vCPU
  persistence_ram             = var.persistence_ram
  registro_workflow_vCPU      = var.registro_workflow_vCPU
  registro_workflow_ram       = var.registro_workflow_ram

  source = "./modules/task_definitions"
}

module "target_listeners" {
  environment                         = var.environment
  project                             = var.project
  manager                             = var.manager
  vpc_id                              = var.vpc_id
  auth_listener_port                  = var.auth_listener_port
  auth_service_port                   = var.auth_service_port
  auth_health_check_path              = var.auth_health_check_path
  catalogo_listener_port              = var.catalogo_listener_port
  catalogo_service_port               = var.catalogo_service_port
  catalogo_health_check_path          = var.catalogo_health_check_path
  persistence_listener_port           = var.persistence_listener_port
  persistence_service_port            = var.persistence_service_port
  persistence_health_check_path       = var.persistence_health_check_path
  registro_workflow_listener_port     = var.registro_workflow_listener_port
  registro_workflow_service_port      = var.registro_workflow_service_port
  registro_workflow_health_check_path = var.registro_workflow_health_check_path

  source = "./modules/target_listeners"
}

module "cloud_watch" {
  environment                = var.environment
  project                    = var.project
  manager                    = var.manager
  repositories               = var.repositories
  ecs_auth_name              = module.ecs_services.ecs_auth_name
  auth_up_arn                = module.ecs_asg.auth_up_arn
  auth_down_arn              = module.ecs_asg.auth_down_arn
  ecs_catalogo_name          = module.ecs_services.ecs_catalogo_name
  catalogo_up_arn            = module.ecs_asg.catalogo_up_arn
  catalogo_down_arn          = module.ecs_asg.catalogo_down_arn
  ecs_persistence_name       = module.ecs_services.ecs_persistence_name
  persistence_up_arn         = module.ecs_asg.persistence_up_arn
  persistence_down_arn       = module.ecs_asg.persistence_down_arn
  ecs_registro_workflow_name = module.ecs_services.ecs_registro_workflow_name
  registro_workflow_up_arn   = module.ecs_asg.registro_workflow_up_arn
  registro_workflow_down_arn = module.ecs_asg.registro_workflow_down_arn

  source = "./modules/cloud_watch"
}

module "ecs_services" {
  environment                                    = var.environment
  project                                        = var.project
  manager                                        = var.manager
  repositories                                   = var.repositories
  private_subnets_id                             = var.private_subnets_id
  auth_service_port                              = var.auth_service_port
  target_auth_service_arn                        = module.target_listeners.target_auth_service_arn
  task_definitions_auth_service_arn              = module.task_definitions.task_definitions_auth_service_arn
  catalogo_service_port                          = var.catalogo_service_port
  target_catalogo_service_arn                    = module.target_listeners.target_catalogo_service_arn
  task_definitions_catalogo_service_arn          = module.task_definitions.task_definitions_catalogo_service_arn
  persistence_service_port                       = var.persistence_service_port
  target_persistence_service_arn                 = module.target_listeners.target_persistence_service_arn
  task_definitions_persistence_service_arn       = module.task_definitions.task_definitions_persistence_service_arn
  registro_workflow_service_port                 = var.registro_workflow_service_port
  target_registro_workflow_service_arn           = module.target_listeners.target_registro_workflow_service_arn
  task_definitions_registro_workflow_service_arn = module.task_definitions.task_definitions_registro_workflow_service_arn
  auth_desired_task                              = var.auth_desired_task
  catalogo_desired_task                          = var.catalogo_desired_task
  persistence_desired_task                       = var.persistence_desired_task
  registro_workflow_desired_task                 = var.registro_workflow_desired_task

  source = "./modules/ecs_services"
}

module "ecs_asg" {
  environment                = var.environment
  project                    = var.project
  manager                    = var.manager
  repositories               = var.repositories
  ecs_auth_name              = module.ecs_services.ecs_auth_name
  auth_min_task              = var.auth_min_task
  auth_max_task              = var.auth_max_task
  ecs_catalogo_name          = module.ecs_services.ecs_catalogo_name
  catalogo_min_task          = var.catalogo_min_task
  catalogo_max_task          = var.catalogo_max_task
  ecs_persistence_name       = module.ecs_services.ecs_persistence_name
  persistence_min_task       = var.persistence_min_task
  persistence_max_task       = var.persistence_max_task
  ecs_registro_workflow_name = module.ecs_services.ecs_registro_workflow_name
  registro_workflow_min_task = var.registro_workflow_min_task
  registro_workflow_max_task = var.registro_workflow_max_task

  source = "./modules/ecs_asg"
}

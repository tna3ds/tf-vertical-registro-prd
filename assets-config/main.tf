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

  source = "./modules/task_definitions"
}

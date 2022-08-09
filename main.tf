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

module "network" {
  vpc_id          = var.vpc_id
  environment     = var.environment
  project         = var.project
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs_name        = var.azs_name
  manager         = var.manager

  source = "./modules/network"
}

module "security" {
  vpc_id      = var.vpc_id
  environment = var.environment
  project     = var.project
  manager     = var.manager

  source = "./modules/security"
}

module "load-balancer" {
  environment        = var.environment
  project            = var.project
  private_subnets_id = module.network.private_subnets_id
  sg_alb_id          = module.security.sg_alb_id
  manager            = var.manager

  source = "./modules/load_balancer"
}

module "iam" {
  manager                                  = var.manager
  repositories                             = var.repositories
  ecs_task_role_policies_name              = var.ecs_task_role_policies_name
  ecs_task_auth_policies_name              = var.ecs_task_auth_policies_name
  ecs_task_catalogo_policies_name          = var.ecs_task_catalogo_policies_name
  ecs_task_persistence_policies_name       = var.ecs_task_persistence_policies_name
  ecs_task_registro-workflow_policies_name = var.ecs_task_registro-workflow_policies_name

  source = "./modules/iam"
}

module "ecs_ecr" {
  environment  = var.environment
  project      = var.project
  manager      = var.manager
  repositories = var.repositories

  source = "./modules/ecs_ecr"
}

module "secrets-manger" {
  manager = var.manager

  source = "./modules/secrets_manager"
}

module "s3" {
  s3_cloudfront_name          = var.s3_cloudfront_name
  environment                 = var.environment
  project                     = var.project
  manager                     = var.manager
  cloudfront_origin_access_id = module.cloudfront.cloudfront_origin_access_id

  source = "./modules/s3"
}

module "cloudfront" {
  s3_cloudfront_name = var.s3_cloudfront_name
  environment        = var.environment
  project            = var.project
  s3_bucket_id       = module.s3.s3_bucket_id
  manager            = var.manager

  source = "./modules/cloudfront"
}

module "dybamodb" {
  manager = var.manager

  source = "./modules/dynamodb"
}

module "cloud-watch" {
  environment = var.environment
  project     = var.project
  manager     = var.manager

  source = "./modules/cloud_watch"
}

module "redis-cluste" {
  environment            = var.environment
  project                = var.project
  private_subnets_id     = module.network.private_subnets_id
  sg_redis_id            = module.security.sg_redis_id
  manager                = var.manager
  redis_slow_logs_name   = module.cloud-watch.redis_slow_logs_name
  redis_engine_logs_name = module.cloud-watch.redis_engine_logs_name

  source = "./modules/redis_cluster"
}

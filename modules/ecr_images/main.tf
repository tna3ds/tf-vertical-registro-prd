data "aws_caller_identity" "current" {}
data "aws_ecr_authorization_token" "token" {}

locals {
  aws_ecr_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}

provider "docker" {
  registry_auth {
    address  = local.aws_ecr_url
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }
}

## Create ECR repository
resource "aws_ecr_repository" "repository" {
    for_each = toset(var.repository_list)
  name = each.key
}

## Build docker images and push to ECR
resource "docker_registry_image" "backend" {
    for_each = toset(var.repository_list)
    name = "${aws_ecr_repository.repository[each.key].repository_url}:latest"

    build {
        context = "../application"
        dockerfile = "${each.key}.Dockerfile"
    }  
}


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


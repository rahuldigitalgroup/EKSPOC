terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source    = "./modules/networking"
  vpc_id    = var.vpc_id
  subnet_ids = var.subnet_ids
}

module "eks" {
  source            = "./modules/eks"
  cluster_name      = var.cluster_name
  cluster_version   = var.cluster_version
  vpc_id            = module.networking.vpc_id
  subnet_ids        = module.networking.subnet_ids
  instance_type     = var.instance_type
}

module "iam" {
  source = "./modules/iam"
}

module "monitoring" {
  source = "./modules/monitoring"
}

module "ingress" {
  source = "./modules/ingress"
}

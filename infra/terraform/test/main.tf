terraform {
  
   backend "s3" {
    bucket         = "jeffrey-terraform-state-2026"
    key            = "test/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "../modules/vpc"
  vpc_cidr        = var.vpc_cidr
  environment     = var.environment
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

module "eks" {
  source           = "../modules/eks"
  cluster_name     = "marriott-${var.environment}-cluster"
  cluster_version  = "1.33"
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.private_subnet_ids
  instance_types   = var.instance_types
  ami_type         = var.ami_type
  desired_capacity = var.desired_capacity
  min_capacity     = var.min_capacity
  max_capacity     = var.max_capacity
  environment      = var.environment
}

module "rds" {
  source      = "../modules/rds"
  identifier  = "marriott-${var.environment}-db"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnet_ids
  environment = var.environment
}

module "redis" {
  source      = "../modules/redis"
  name        = "marriott-${var.environment}-redis"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnet_ids
  environment = var.environment
}

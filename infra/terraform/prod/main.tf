terraform {
  backend "s3" {
    bucket         = "jeffrey-terraform-state-2026"
    key            = "prod/terraform.tfstate"
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


# ==============================================
# Provider
# ==============================================
provider "aws" {
  alias  = "east"
  region = var.region_east
}

provider "aws" {
  alias  = "west"
  region = var.region_west
}

# ==============================================
# us-east-1
# ==============================================
module "vpc_east" {
  source          = "../modules/vpc"

  vpc_cidr        = var.vpc_cidr_east
  environment     = var.environment
  azs             = var.azs_east
  private_subnets = var.private_subnets_east
  public_subnets  = var.public_subnets_east
}

module "eks_east" {
  source           = "../modules/eks"

  cluster_name     = "marriott-${var.environment}-east-cluster"
  cluster_version  = "1.33"
  vpc_id           = module.vpc_east.vpc_id
  subnet_ids       = module.vpc_east.private_subnet_ids
  instance_types   = var.instance_types
  ami_type         = var.ami_type
  desired_capacity = var.desired_capacity
  min_capacity     = var.min_capacity
  max_capacity     = var.max_capacity
  environment      = var.environment
}

module "rds_east" {
  source      = "../modules/rds"

  identifier  = "marriott-${var.environment}-east-db"
  vpc_id      = module.vpc_east.vpc_id
  subnet_ids  = module.vpc_east.private_subnet_ids
  environment = var.environment
}

module "redis_east" {
  source      = "../modules/redis"

  name        = "marriott-${var.environment}-east-redis"
  vpc_id      = module.vpc_east.vpc_id
  subnet_ids  = module.vpc_east.private_subnet_ids
  environment = var.environment
}

# ==============================================
# us-west-2
# ==============================================
module "vpc_west" {
  source          = "../modules/vpc"

  vpc_cidr        = var.vpc_cidr_west
  environment     = var.environment
  azs             = var.azs_west
  private_subnets = var.private_subnets_west
  public_subnets  = var.public_subnets_west
}

module "eks_west" {
  source           = "../modules/eks"

  cluster_name     = "marriott-${var.environment}-west-cluster"
  cluster_version  = "1.30"
  vpc_id           = module.vpc_west.vpc_id
  subnet_ids       = module.vpc_west.private_subnet_ids
  instance_types   = var.instance_types
  ami_type         = var.ami_type
  desired_capacity = var.desired_capacity
  min_capacity     = var.min_capacity
  max_capacity     = var.max_capacity
  environment      = var.environment
}

module "rds_west" {
  source      = "../modules/rds"

  identifier  = "marriott-${var.environment}-west-db"
  vpc_id      = module.vpc_west.vpc_id
  subnet_ids  = module.vpc_west.private_subnet_ids
  environment = var.environment
}

module "redis_west" {
  source      = "../modules/redis"

  name        = "marriott-${var.environment}-west-redis"
  vpc_id      = module.vpc_west.vpc_id
  subnet_ids  = module.vpc_west.private_subnet_ids
  environment = var.environment
}

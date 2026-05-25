environment      = "prod"

#us-east-1
region_east      = "us-east-1"
vpc_cidr_east    = "10.30.0.0/16"
azs_east         = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets_east = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
public_subnets_east  = ["10.30.101.0/24", "10.30.102.0/24", "10.30.103.0/24"]

#us-west-2
region_west      = "us-west-2"
vpc_cidr_west    = "10.40.0.0/16"
azs_west         = ["us-west-2a", "us-west-2b", "us-west-2c"]
private_subnets_west = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24"]
public_subnets_west  = ["10.40.101.0/24", "10.40.102.0/24", "10.40.103.0/24"]

# EKS
instance_types   = ["t3.large"]
ami_type         = "AL2_x86_64"
desired_capacity = 3
min_capacity     = 2
max_capacity     = 5

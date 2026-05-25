# ==============================================
# golal environment
# ==============================================
variable "environment" {
  type    = string
  default = "prod"
}

# ==============================================
# us-east-1
# ==============================================
variable "region_east" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr_east" {
  type    = string
  default = "10.30.0.0/16"
}

variable "azs_east" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets_east" {
  type    = list(string)
  default = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
}

variable "public_subnets_east" {
  type    = list(string)
  default = ["10.30.101.0/24", "10.30.102.0/24", "10.30.103.0/24"]
}

# ==============================================
#  us-west-2
# ==============================================
variable "region_west" {
  type    = string
  default = "us-west-2"
}

variable "vpc_cidr_west" {
  type    = string
  default = "10.40.0.0/16"
}

variable "azs_west" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "private_subnets_west" {
  type    = list(string)
  default = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24"]
}

variable "public_subnets_west" {
  type    = list(string)
  default = ["10.40.101.0/24", "10.40.102.0/24", "10.40.103.0/24"]
}

# ==============================================
# EKS config
# ==============================================
variable "instance_types" {
  type    = list(string)
  default = ["t3.large"]
}

variable "ami_type" {
  type    = string
  default = "AL2_x86_64"
}

variable "desired_capacity" {
  type    = number
  default = 3
}

variable "min_capacity" {
  type    = number
  default = 2
}

variable "max_capacity" {
  type    = number
  default = 5
}

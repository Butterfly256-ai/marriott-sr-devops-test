variable "environment" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR"
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "Availability Zones"
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
}

variable "ami_type" {
  type = string
  default = "AL2_x86_64"
}

variable "desired_capacity" {
  type        = number
  default     = 2
}

variable "min_capacity" {
  type        = number
  default     = 1
}

variable "max_capacity" {
  type        = number
  default     = 3
}

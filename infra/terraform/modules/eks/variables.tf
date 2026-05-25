variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type    = string
  default = "1.33"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "instance_types" {
  type = list(string)
}

variable "ami_type" {
  type = string
}

variable "desired_capacity" {
  type = number
}

variable "min_capacity" {
  type = number
}

variable "max_capacity" {
  type = number
}

variable "environment" {
  type = string
}

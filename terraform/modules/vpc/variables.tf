###----VPC creation

variable "name" {
  description = "Name prefix for VPC resources"
  type        = string
}

###----VPC CIDR

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

###----VPC AZ

variable "availability_zones" {
  description = "Availability Zones used by the VPC"
  type        = list(string)
}

###----VPC public_subnet_cidrs

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

###----VPC private_subnet_cidrs

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}
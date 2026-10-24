###----ALB NAME

variable "name" {
  description = "Name of the Application Load Balancer"
  type        = string
}


###----VPC ID

variable "vpc_id" {
  description = "VPC ID where the ALB is created"
  type        = string
}


###----PUBLIC SUBNET IDS

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}


###----ALB SECURITY GROUP ID

variable "security_group_id" {
  description = "Security group ID attached to the ALB"
  type        = string
}
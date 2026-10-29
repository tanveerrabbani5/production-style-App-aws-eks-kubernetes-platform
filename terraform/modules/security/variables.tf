###----VPC ID

variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}


###----SECURITY GROUP NAME PREFIX

variable "name" {
  description = "Name prefix used for security groups"
  type        = string
}



variable "eks_cluster_security_group_id" {
  description = "Security group ID of the EKS cluster"
  type        = string
}

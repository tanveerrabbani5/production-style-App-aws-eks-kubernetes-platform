###----EKS CLUSTER NAME

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}


###----EKS CLUSTER ROLE ARN

variable "cluster_role_arn" {
  description = "IAM role ARN used by the EKS control plane"
  type        = string
}


###----EKS NODE ROLE ARN

variable "node_role_arn" {
  description = "IAM role ARN used by EKS worker nodes"
  type        = string
}


###----VPC ID

variable "vpc_id" {
  description = "VPC ID where the EKS cluster is deployed"
  type        = string
}


###----PRIVATE SUBNET IDS

variable "private_subnet_ids" {
  description = "Private subnet IDs used by the EKS cluster and nodes"
  type        = list(string)
}


###----KUBERNETES VERSION

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"
}


###----NODE INSTANCE TYPES

variable "node_instance_types" {
  description = "EC2 instance types for the EKS managed node group"
  type        = list(string)

  default = [
    "t3.micro"
  ]
}


###----NODE DESIRED SIZE

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}


###----NODE MIN SIZE

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}


###----NODE MAX SIZE

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 2
}
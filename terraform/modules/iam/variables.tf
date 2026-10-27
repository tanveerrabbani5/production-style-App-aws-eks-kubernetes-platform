###----GENERAL IAM SETTINGS

variable "name" {
  description = "Name prefix used for IAM resources"
  type        = string
}


###----EKS OIDC ISSUER URL

variable "eks_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster"
  type        = string
}
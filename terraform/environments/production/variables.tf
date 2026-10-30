###----RDS DATABASE PASSWORD

variable "db_password" {
  description = "Master password for the RDS database"
  type        = string
  sensitive   = true
}


###----EKS public_access_cidrs

variable "public_access_cidrs" {
  description = "Allowed public IP ranges for EKS API access"
  type        = list(string)
}
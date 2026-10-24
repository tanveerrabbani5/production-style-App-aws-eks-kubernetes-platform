###----RDS INSTANCE IDENTIFIER

variable "identifier" {
  description = "RDS instance identifier"
  type        = string
}


###----DATABASE NAME

variable "database_name" {
  description = "Initial database name"
  type        = string
}


###----DATABASE ENGINE

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}


###----DATABASE ENGINE VERSION

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "17"
}


###----DATABASE INSTANCE CLASS

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}


###----DATABASE USERNAME

variable "username" {
  description = "Master username for the database"
  type        = string
}


###----DATABASE PASSWORD

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}


###----PRIVATE SUBNET IDS

variable "private_subnet_ids" {
  description = "Private subnet IDs for the RDS subnet group"
  type        = list(string)
}


###----VPC SECURITY GROUP IDS

variable "security_group_ids" {
  description = "Security groups attached to the RDS instance"
  type        = list(string)
}
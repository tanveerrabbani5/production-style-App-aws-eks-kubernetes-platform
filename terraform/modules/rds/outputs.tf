###----RDS ENDPOINT

output "endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.this.endpoint
}


###----RDS ADDRESS

output "address" {
  description = "RDS database address"
  value       = aws_db_instance.this.address
}


###----RDS PORT

output "port" {
  description = "RDS database port"
  value       = aws_db_instance.this.port
}


###----RDS DATABASE NAME

output "database_name" {
  description = "RDS database name"
  value       = aws_db_instance.this.db_name
}
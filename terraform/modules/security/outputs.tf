
###----ALB SECURITY GROUP ID

output "alb_security_group_id" {
  description = "Security group ID for the Application Load Balancer"
  value       = aws_security_group.alb.id
}


###----EKS CLUSTER SECURITY GROUP ID

output "eks_node_security_group_id" {
  description = "EKS cluster security group ID used by the application"
  value       = var.eks_cluster_security_group_id
}


###----RDS SECURITY GROUP ID

output "rds_security_group_id" {
  description = "Security group ID for RDS"
  value       = aws_security_group.rds.id
}

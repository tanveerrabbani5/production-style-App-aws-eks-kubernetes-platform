###----EKS CLUSTER NAME

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.this.name
}


###----EKS CLUSTER ARN

output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = aws_eks_cluster.this.arn
}


###----EKS CLUSTER ENDPOINT

output "cluster_endpoint" {
  description = "Endpoint of the EKS Kubernetes API server"
  value       = aws_eks_cluster.this.endpoint
}


###----EKS CLUSTER SECURITY GROUP ID

output "cluster_security_group_id" {
  description = "Security group ID created for the EKS cluster"
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}


###----EKS NODE GROUP NAME

output "node_group_name" {
  description = "Name of the EKS managed node group"
  value       = aws_eks_node_group.this.node_group_name
}


###----EKS NODE GROUP ARN

output "node_group_arn" {
  description = "ARN of the EKS managed node group"
  value       = aws_eks_node_group.this.arn
}
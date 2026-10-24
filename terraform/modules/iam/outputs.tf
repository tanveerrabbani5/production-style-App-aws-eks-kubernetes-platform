###----EKS ROLE OUTPUT

output "eks_cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster.arn
}


###----EKS NODE ROLE OUTPUT

output "eks_node_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = aws_iam_role.eks_node.arn
}


###----LOAD BALANCER CONTROLLER ROLE OUTPUT

output "load_balancer_controller_role_arn" {
  description = "ARN of the Load Balancer Controller IAM role"
  value       = aws_iam_role.load_balancer_controller.arn
}
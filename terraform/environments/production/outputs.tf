
output "alb_security_group_id" {
  description = "Security group ID for the application load balancer"
  value       = module.security.alb_security_group_id
}

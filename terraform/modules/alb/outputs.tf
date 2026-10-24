###----ALB ARN

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.this.arn
}


###----ALB DNS NAME

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.this.dns_name
}


###----TARGET GROUP ARN

output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.this.arn
}


###----ALB ZONE ID

output "alb_zone_id" {
  description = "Route 53 hosted zone ID used by the ALB"
  value       = aws_lb.this.zone_id
}
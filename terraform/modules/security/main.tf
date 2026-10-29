
###----ALB SECURITY GROUP

resource "aws_security_group" "alb" {
  name        = "${var.name}-alb-sg"
  description = "Security group for the Application Load Balancer"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-alb-sg"
  }
}


###----ALB HTTP INBOUND

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Allow public HTTP traffic"
}


###----ALB HTTPS INBOUND

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "Allow public HTTPS traffic"
}


###----ALB OUTBOUND

resource "aws_vpc_security_group_egress_rule" "alb_all" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow ALB outbound traffic"
}


####################################################################################


###----ALLOW ALB TO REACH EKS APPLICATION

resource "aws_vpc_security_group_ingress_rule" "eks_from_alb" {
  security_group_id            = var.eks_cluster_security_group_id
  referenced_security_group_id = aws_security_group.alb.id
  from_port                    = 5000
  to_port                      = 5000
  ip_protocol                  = "tcp"
  description                  = "Allow ALB traffic to the application"
}


####################################################################################


###----RDS SECURITY GROUP

resource "aws_security_group" "rds" {
  name        = "${var.name}-rds-sg"
  description = "Security group for PostgreSQL RDS"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-rds-sg"
  }
}


###----ALLOW EKS TO REACH POSTGRESQL

resource "aws_vpc_security_group_ingress_rule" "rds_from_eks" {
  security_group_id            = aws_security_group.rds.id
  referenced_security_group_id = var.eks_cluster_security_group_id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  description                  = "Allow PostgreSQL traffic from EKS"
}


###----RDS OUTBOUND

resource "aws_vpc_security_group_egress_rule" "rds_all" {
  security_group_id = aws_security_group.rds.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow RDS outbound traffic"
}

####################################################################################
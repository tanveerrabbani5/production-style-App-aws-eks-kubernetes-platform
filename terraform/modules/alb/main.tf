###----APPLICATION LOAD BALANCER

resource "aws_lb" "this" {
  name = var.name

  load_balancer_type = "application"

  internal = false

  security_groups = [
    var.security_group_id
  ]

  subnets = var.public_subnet_ids

  tags = {
    Name = var.name
  }
}


###----ALB TARGET GROUP

resource "aws_lb_target_group" "this" {
  name = "${var.name}-tg"

  port     = 5000
  protocol = "HTTP"

  vpc_id = var.vpc_id

  target_type = "ip"

  health_check {
    enabled = true

    path = "/health"

    protocol = "HTTP"

    port = "5000"

    healthy_threshold   = 2
    unhealthy_threshold = 3

    timeout  = 5
    interval = 30

    matcher = "200"
  }

  tags = {
    Name = "${var.name}-tg"
  }
}


###----ALB HTTP LISTENER

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.this.arn
  }
}
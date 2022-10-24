resource "aws_lb_target_group" "main" {
  count = var.create_target_group ? 1 : 0
  name        = var.name
  port        = var.port
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = var.vpc_id
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
  
  dynamic health_check {
    for_each = var.health_check != null ? [var.health_check] : []
     content {
      enabled             = try(health_check.value.enabled, null)
      interval            = try(health_check.value.interval, null)
      #path                = try(health_check.value.path, null)
      port                = try(health_check.value.port, null)
      healthy_threshold   = try(health_check.value.healthy_threshold, null)
      unhealthy_threshold = try(health_check.value.unhealthy_threshold, null)
      timeout             = try(health_check.value.timeout, null)
      protocol            = try(health_check.value.protocol, null)
      #matcher             = try(health_check.value.matcher, null)
    }
  }

  dynamic stickiness {
    for_each = var.stickiness != null ? [var.stickiness] : []
    content {
     enabled         = try(stickiness.value.enabled, true)
     type            = try(stickiness.value.type, null)
    }
  }
}


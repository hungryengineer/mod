resource "aws_lb_listener" "frontend_http_tcp" {
  count = var.create_lb_listener ? 1 : 0
  load_balancer_arn = var.load_balancer_arn
  port     = var.port
  protocol = var.protocol

  dynamic "default_action" {
    for_each = var.default_action != null ? [1] : []

    # Defaults to forward action if action_type not specified
    content {
      type             = try(default_action.value.type, null)
      target_group_arn = try(default_action.value.target_group_arn, null)
    }
  }
    #   dynamic "redirect" {
    #     for_each = var.redirect != null ? [var.redirect] : []

    #     content {
    #       path        = try(redirect.value.path, null)
    #       host        = try(redirect.value.host, null)
    #       port        = try(redirect.value.port, null)
    #       protocol    = try(redirect.value.protocol, null)
    #       query       = try(redirect.value.query, null)
    #       status_code = try(redirect.value["status_code"])
    #     }
    #   }

    #   dynamic "fixed_response" {
    #     for_each = var.fixed_response != null ? [var.fixed_response] : []
    #     content {
    #       content_type = try(fixed_response.value.content_type, null)
    #       message_body = try(fixed_response.value.message_body, null)
    #       status_code  = try(fixed_response.value.status_code, null)
    #     }
    #   }

  tags = var.tags
}
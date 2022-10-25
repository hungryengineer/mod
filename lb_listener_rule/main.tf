resource "aws_lb_listener_rule" "host_based_routing" {
  count = var.aws_lb_listener_rule != null ? [var.aws_lb_listener_rule] : []
  listener_arn = var.listener_arn
  priority     = var.priority
  
  dynamic "action" {
    for_each = var.action !=null ? [var.action] : []

    content {
      type = try(action.value.type, null)
      forward {
        dynamic "target_group" {
          for_each = var.target_group != null ? [var.target_group] : []

          content {
            arn    = var.arn
            weight = try(target_group.value.weight, null)
          }
        }
        dynamic "stickiness" {
           for_each = var.stickiness != null ? [var.stickiness] : []
           content {
              enabled         = try(stickiness.value.enabled, true)
              type            = try(stickiness.value.type, null)
          }
        }
      }
    }
  }

   # Path Pattern condition
  dynamic "condition" {
    for_each = var.condition != null ? [var.condition] : []

    content {
      path_pattern {
        values = condition.value["path_patterns"]
      }
    }
  }

  # Host header condition
#   dynamic "condition" {
#     for_each = var.condition != null ? [var.condition] : []

#     content {
#       host_header {
#         values = condition.value["host_headers"]
#       }
#     }
#   }

}


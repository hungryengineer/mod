resource "aws_lb_listener_rule" "host_based_routing" {
  count = var.create_lb_listener ? 1 : 0
  listener_arn = var.listener_arn
  priority     = var.priority
  
  dynamic "action" {
    for_each = var.action !=null ? [var.action] : []

    content {
      type = try(action.value.type, null)
      target_group_arn = var.target_group_arn
    # USE BELOW BLOCK TO ROUTE A %AGE OF TRAFFIC BETWEEN TWO TARGET GROUPS
    #   forward { 
    #     dynamic "target_group" {
    #       for_each = var.target_group != null ? [var.target_group] : []
    #       content {
    #         arn    = var.target_group_arn
    #         weight = try(target_group.value.weight, null)
    #   }
    # }
        
    #     dynamic "stickiness" {
    #        for_each = var.rule_stickiness != null ? [var.rule_stickiness] : []
    #        content {
    #           enabled         = try(stickiness.value.enabled, true)
    #           duration        = try(stickiness.value.duration, null)
          }
        }
      
    


   # Path Pattern condition
  dynamic "condition" {
    for_each = var.condition != null ? [var.condition] : []

    content {
      path_pattern {
        values = condition.value.path_pattern.values
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
  }



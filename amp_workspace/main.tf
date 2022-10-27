resource "aws_prometheus_workspace" "main" {
  count = var.create_workspace ? 1 : 0
  alias = var.alias

  #NOTE below is unsupported now by aws AMP
#   dynamic "logging_configuration" {
#     for_each = length(var.logging_configuration) > 0 ? [var.logging_configuration] : []
#     content {
#     log_group_arn = var.log_group_arn
#   }
# }

  #tags = var.tags
}
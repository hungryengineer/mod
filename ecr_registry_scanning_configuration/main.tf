resource "aws_ecr_registry_scanning_configuration" "main" {
  count = var.create_registry_scanning_configuration ? 1 : 0

  scan_type = var.registry_scan_type

  dynamic "rule" {
    for_each = var.rule != null ? [var.rule] : []
    content {
        scan_frequency    = try(rule.value.scan_frequency, null)
        repository_filter {
            filter      = try(rule.value.filter, null)
            filter_type = try(rule.value.filter_type, null)
        }
    }
  }
}
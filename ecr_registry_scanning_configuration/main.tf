resource "aws_ecr_registry_scanning_configuration" "main" {
  count = var.create_registry_scanning_configuration ? 1 : 0

  scan_type = var.registry_scan_type

  dynamic "rule" {
    for_each = var.registry_scan_rule != null ? [registry_scan_rule] : []
    content {
        scan_frequency    = rule.value.scan_frequency
        repository_filter {
            filter      = rule.value.filter
            filter_type = rule.value.filter_type
        }
    }
  }
}
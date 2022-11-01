resource "aws_route53_health_check" "primary" {
  count             = var.create_health_check ? 1 : 0
  fqdn              = var.fqdn
  port              = var.port
  type              = element(var.type, count.index)
  resource_path     = var.resource_path
  failure_threshold = var.failure_threshold
  request_interval  = var.request_interval
  tags              = var.tags
}
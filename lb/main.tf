resource "aws_lb" "main" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets #[for subnet in aws_subnet.public : subnet.id]
  enable_deletion_protection = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  ip_address_type                  = var.ip_address_type
  desync_mitigation_mode           = var.desync_mitigation_mode
#   dynamic access_logs {
#     for_each = length(keys(var.access_logs)) == 0 ? [] : [var.access_logs]
#     content {
#         enabled = access_logs.value.enabled
#         bucket = access_logs.value.bucket
#         prefix = access_logs.value.prefix
#     }
#   }
   tags = merge(
    { "Name" = var.name }, var.tags, var.lb_tags,)
}
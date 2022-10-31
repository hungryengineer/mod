resource "aws_route53_record" "main" {
  count   = var.create_records ? 1 : 0 
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl
  records = element(var.records, count.index)
  dynamic "weighted_routing_policy" {
    for_each = length(var.weighted_routing_policy) == 0 ? [] : [true]

    content {
      weight = each.value.weighted_routing_policy.weight
    }
  }


}
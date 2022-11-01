resource "aws_route53_record" "main" {
  count   = length(var.records) > 0 ? 1 : 0 
  zone_id = var.zone_id
  name    = var.name
  type    = element(var.type, count.index)
  ttl     = var.ttl
  records = element(var.records, count.index)
  set_identifier = element(var.set_identifier, count.index)

  dynamic "weighted_routing_policy" {
    for_each = length(var.weighted_routing_policy) == 0 ? [] : [var.weighted_routing_policy]

    content {
      weight = weighted_routing_policy.value.weight
    }
  }


}
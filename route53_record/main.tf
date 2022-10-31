resource "aws_route53_record" "main" {
  count   = length(var.records) > 0 ? 1 : 0 
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl
  records = element(var.records, count.index)
  dynamic "weighted_routing_policy" {
    for_each = length(var.weighted_routing_policy) == 0 ? [] : [true]

    content {
      weight = try(weighted_routing_policy.value.weight, null)
    }
  }


}
resource "aws_route53_record" "main" {
  count   = length(var.records) 
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = element(var.records, count.index)
  dynamic "weighted_routing_policy" {
    for_each = length(var.weighted_routing_policy) == 0 ? [] : [true]

    content {
      weight = each.value.weighted_routing_policy.weight
    }
  }


}
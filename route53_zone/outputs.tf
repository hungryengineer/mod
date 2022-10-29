output "route53_zone_arn" {
    value = aws_route53_zone.primary[*].arn
}

output "route53_zone_zone_id" {
    value = aws_route53_zone.primary[*].zone_id
}

output "route53_zone_name_servers" {
    value = aws_route53_zone.primary[*].name_servers
}
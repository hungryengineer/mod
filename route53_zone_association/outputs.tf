output "route53_zone_association_id" {
    value = aws_route53_zone_association.primary[*].id
}
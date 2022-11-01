output "route53_health_check_id" {
    value = aws_route53_health_check.primary[*].id
}

output "route53_health_check_arn" {
    value = aws_route53_health_check.primary[*].arn
}
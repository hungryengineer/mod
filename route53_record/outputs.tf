output "route53_name" {
    value = aws_route53_record.main[*].name
}

output "route53_fqdn" {
    value = aws_route53_record.main[*].fqdn
}
output "security_group_id" {
    value = aws_security_group.main[*].id
}

output "security_group_arn" {
    value = aws_security_group.main[*].arn
}

output "security_group_ingress_id" {
    value = aws_security_group.main.ingress[*].id
}
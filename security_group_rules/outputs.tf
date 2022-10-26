output "security_group_rules_id" {
    value = aws_security_group_rule.rules[*].id
}

output "security_group_rules_arn" {
    value = aws_security_group_rule.rules[*].arn
}
output "security_group_rules_id" {
    value = aws_security_group_rule.rules[*].id
}
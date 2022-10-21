output "nacl_rule_id" {
    value = aws_network_acl_rule.main[*].id
}
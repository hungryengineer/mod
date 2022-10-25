output "lb_listener_rule_id" {
    value = aws_lb_listener_rule.host_based_routing[*].id
}

output "lb_listener_rule_arn" {
    value = aws_lb_listener_rule.host_based_routing[*].arn
}
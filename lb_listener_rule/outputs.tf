output "lb_listener_rule.id" {
    value = aws_lb_listener_rule.host_based_routing[*].id
}

output "lb_listener_rule.arn" {
    value = aws_lb_listener_rule.host_based_routing[*].arn
}
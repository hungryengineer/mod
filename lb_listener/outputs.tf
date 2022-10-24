output "lb_listener_id" {
    value = aws_lb_listener.frontend_http_tcp[*].id
}

output "lb_listener_arn" {
    value = aws_lb_listener.frontend_http_tcp[*].arn
}
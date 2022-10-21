output "route_id" {
    value = aws_route.main[*].id
}

output "route_state" {
    value = aws_route.main.state
}
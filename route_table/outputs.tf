output "route_table_id" {
    value = aws_route_table.main[*].id
}

output "route_table_arn" {
    value = aws_route_table.main[*].arn
}
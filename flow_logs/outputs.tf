output "flow_log_id" {
    value = aws_flow_log.main[*].id
}

output "flow_log_arn" {
    value = aws_flow_log.main[*].arn
}
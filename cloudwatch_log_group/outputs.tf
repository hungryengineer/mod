output "cloudwatch_log_arn" {
    value = aws_cloudwatch_log_group.main[*].arn
}
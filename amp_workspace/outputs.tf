output "aws_prometheus_workspace_id" {
    value = aws_prometheus_workspace.main[*].id
}

output "aws_prometheus_workspace_arn" {
    value = aws_prometheus_workspace.main[*].arn
}

output "aws_prometheus_workspace_prometheus_endpoint" {
    value = aws_prometheus_workspace.main[*].prometheus_endpoint
}
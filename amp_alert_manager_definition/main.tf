resource "aws_prometheus_alert_manager_definition" "main" {
  workspace_id = var.workspace_id
  definition   = var.definition
}
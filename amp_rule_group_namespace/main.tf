resource "aws_prometheus_rule_group_namespace" "main" {
  name         = var.name
  workspace_id = var.workspace_id
  data         = var.data
}
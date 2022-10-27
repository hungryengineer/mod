resource "aws_cloudwatch_log_group" "main" {
  name = var.name

  tags = var.tags
}
resource "aws_ecr_lifecycle_policy" "main" {
  count = var.create_lifecycle_policy ? 1 : 0

  repository = var.repository
  policy     = var.repository_lifecycle_policy
}
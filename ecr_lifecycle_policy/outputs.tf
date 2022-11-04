output "lifecycle_policy_repository" {
    value = aws_ecr_lifecycle_policy.main[*].repository
}

output "lifecycle_policy_registry_id" {
    value = aws_ecr_lifecycle_policy.main[*].registry_id
}
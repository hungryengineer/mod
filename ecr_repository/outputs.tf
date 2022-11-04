output "ecr_repository_arn" {
    value = aws_ecr_repository.main[*].arn
}

output "ecr_repository_registry_id" {
    value = aws_ecr_repository.main[*].registry_id
}

output "ecr_repository_repository_url" {
    value = aws_ecr_repository.main[*].repository_url
}
output "ecr_repository_arn" {
    value = aws_ecr_repository.main[*].ecr_repository_arn
}

output "ecr_repository_registry_id" {
    value = aws_ecr_repository.main[*].ecr_repository_registry_id
}

output "ecr_repository_repository_url" {
    value = aws_ecr_repository.main[*].ecr_repository_repository_url
}
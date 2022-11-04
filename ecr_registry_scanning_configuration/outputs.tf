output "ecr_registry_scanning_configuration_registry_id" {
    value = aws_ecr_registry_scanning_configuration.main[*].registry_id
}
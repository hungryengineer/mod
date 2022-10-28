output "db_instance_address" {
    value = aws_db_instance.main[*].address
}

output "db_instance_arn" {
    value = aws_db_instance.main[*].arn
}

output "db_instance_domain" {
    value = aws_db_instance.main[*].domain
}

output "db_instance_endpoint" {
    value = aws_db_instance.main[*].endpoint
}

output "db_instance_hosted_zone_id" {
    value = aws_db_instance.main[*].hosted_zone_id
}

output "db_instance_id" {
    value = aws_db_instance.main[*].id
}

output "db_instance_resource_id" {
    value = aws_db_instance.main[*].resource_id
}
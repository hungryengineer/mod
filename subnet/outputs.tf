output "subnet_id" {
    value = aws_subnet.private_subnets[*].id
}

output "subnet_arn" {
    value = aws_subnet.private_subnets[*].arn
}
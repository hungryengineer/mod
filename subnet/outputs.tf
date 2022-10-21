output "subnet_id" {
    value = aws_subnet.subnets[*].id
}

output "subnet_arn" {
    value = aws_subnet.subnets[*].arn
}
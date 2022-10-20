output "vpc_id" {
    value = aws_vpc.main[*].vpc_id
    description = "The ID of the VPC"
}

output "arn" {
    value = aws_vpc.main[*].arn
    description = "Amazon Resource Name (ARN) of VPC"
}

output "owner_id" {
    value = aws_vpc.main[*].owner_id
    description = "Amazon Resource Name (ARN) of VPC"
}
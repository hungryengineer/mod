output "ec2_instance_arn" {
    value = aws_instance.main[*].arn
}

output "ec2_instance_instance_state" {
    value = aws_instance.main[*].instance_state
}

output "ec2_instance_primary_network_interface_id" {
    value = aws_instance.main[*].primary_network_interface_id
}

output "ec2_instance_private_dns" {
    value = aws_instance.main[*].private_dns
}

# output "ec2_instance_volume_id" {
#     value = aws_instance.main[*].volume_id
# }
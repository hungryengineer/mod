output "network_interface_arn" {
    value = aws_network_interface.main[*].arn
}

output "network_interface_id" {
    value = aws_network_interface.main[*].id
}

output "network_interface_mac_address" {
    value = aws_network_interface.main[*].mac_address
}

output "network_interface_private_dns_name" {
    value = aws_network_interface.main[*].private_dns_name
}
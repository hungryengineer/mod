resource "aws_network_interface" "main" {
  count = var.create_network_interface ? 1 : 0
  subnet_id       = var.subnet_id
  # private_ips     = var.private_ips
  security_groups = var.security_groups

  # dynamic attachment {
  #   for_each = var.attachment != null ? [var.attachment] : []
  #   content {
  #       instance = attachment.value.instance
  #       device_index = attachment.value.device_index
  #   }
  # }
  tags = var.tags
}

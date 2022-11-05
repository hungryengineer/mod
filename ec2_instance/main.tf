resource "aws_instance" "main" {
  count = var.create_instance ? 1 : 0

  ami                  = var.ami
  instance_type        = var.instance_type
#   cpu_core_count       = var.cpu_core_count
#   cpu_threads_per_core = var.cpu_threads_per_core
  hibernation          = var.hibernation

#   user_data                   = var.user_data
#   user_data_base64            = var.user_data_base64
#   user_data_replace_on_change = var.user_data_replace_on_change

  availability_zone      = element(var.availability_zone, count.index)
  subnet_id              = element(var.subnet_id, count.index)
  vpc_security_group_ids = var.vpc_security_group_ids

#   key_name               = var.key_name
  monitoring             = var.monitoring

  associate_public_ip_address = var.associate_public_ip_address
#   private_ip                  = var.private_ip
#   secondary_private_ips       = var.secondary_private_ips
#   ipv6_address_count          = var.ipv6_address_count
#   ipv6_addresses              = var.ipv6_addresses

  ebs_optimized = var.ebs_optimized

#   dynamic "capacity_reservation_specification" {
#     for_each = length(var.capacity_reservation_specification) !=null ? [var.capacity_reservation_specification] : []
#     content {
#       capacity_reservation_preference = try(capacity_reservation_specification.value.capacity_reservation_preference, null)

#       dynamic "capacity_reservation_target" {
#         for_each = try([capacity_reservation_specification.value.capacity_reservation_target], [])
#         content {
#           capacity_reservation_id                 = try(capacity_reservation_target.value.capacity_reservation_id, null)
#           capacity_reservation_resource_group_arn = try(capacity_reservation_target.value.capacity_reservation_resource_group_arn, null)
#         }
#       }
#     }
#   }

# NOTE: In total terraform supports three types of block devices i.e root, ebs and ephemeral or instance store

#   dynamic "root_block_device" {
#     for_each = var.root_block_device
#     content {
#       delete_on_termination = try(root_block_device.value.delete_on_termination, null)
#       encrypted             = try(root_block_device.value.encrypted, null)
#       iops                  = try(root_block_device.value.iops, null)
#       kms_key_id            = try(root_block_device.value.kms_key_id, null)
#       volume_size           = try(root_block_device.value.volume_size, null)
#       volume_type           = try(root_block_device.value.volume_type, null)
#       throughput            = try(root_block_device.value.throughput, null)
#       tags                  = try(root_block_device.value.tags, null)
#     }
#   }

#   dynamic "ebs_block_device" {
#     for_each = var.ebs_block_device
#     content {
#       delete_on_termination = try(ebs_block_device.value.delete_on_termination, null)
#       device_name           = ebs_block_device.value.device_name
#       encrypted             = try(ebs_block_device.value.encrypted, null)
#       iops                  = try(ebs_block_device.value.iops, null)
#       kms_key_id            = try(ebs_block_device.value.kms_key_id, null)
#       snapshot_id           = try(ebs_block_device.value.snapshot_id, null)
#       volume_size           = try(ebs_block_device.value.volume_size, null)
#       volume_type           = try(ebs_block_device.value.volume_type, null)
#       throughput            = try(ebs_block_device.value.throughput, null)
#     }
#   }

  dynamic "network_interface" {
    for_each = var.network_interface 
    content {
      device_index          = element(var.device_index, count.index)
      network_interface_id  = element(var.network_interface_id, count.index)
      delete_on_termination = var.delete_on_termination
    }
  }

#   dynamic "launch_template" {
#     for_each = var.launch_template != null ? [var.launch_template] : []
#     content {
#       id      = try(var.launch_template.id, null)
#       name    = try(var.launch_template.name, null)
#       version = try(var.launch_template.version, null)
#     }
#   }

#   enclave_options {
#     enabled = var.enclave_options_enabled
#   }

  source_dest_check                    = length(var.network_interface) > 0 ? null : var.source_dest_check
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
#   placement_group                      = var.placement_group
  tenancy                              = var.tenancy
#   host_id                              = var.host_id
  tags        = var.tags
  volume_tags = var.volume_tags
}
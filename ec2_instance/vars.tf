variable "create_instance" {
  
}

variable "ami" {
  
}

variable "instance_type" {
  
}

# variable "cpu_core_count" {
#     description = "for multithreading support"
  
# }

# variable "cpu_threads_per_core" {
  
# }

variable "hibernation" {
  
}

# variable "user_data" {
  
# }

# variable "user_data_base64" {
  
# }

# variable "user_data_replace_on_change" {
#   description = "forces new creation of the instance if true"
# }

variable "availability_zone" {
  
}

variable "subnet_id" {
  
}

variable "vpc_security_group_ids" {
  
}

# variable "key_name" {
  
# }

variable "monitoring" {
  
}

variable "associate_public_ip_address" {
  
}

# variable "private_ip" {
  
# }

variable "ebs_optimized" {
  
}

# variable "capacity_reservation_specification" {
  
# }

# variable "root_block_device" {
  
# }

# variable "ebs_block_device" {
  
# }

variable "network_interface" {
  
}

variable "network_interface_id" {
  
}
# variable "launch_template" {
  
# }

# variable "enclave_options" {
  
# }

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true"
}

variable "disable_api_termination" {
  
}

variable "instance_initiated_shutdown_behavior" {
  
}

variable "tenancy" {
  
}

# variable "host_id" {
  
# }

variable "tags" {
  
}

variable "volume_tags" {
  
}
resource "aws_vpc" "main" {
  count                = length(var.cidr_block) 
  cidr_block           = element(var.cidr_block, count.index)
  ipv4_ipam_pool_id    = var.ipv4_ipam_pool_id
  ipv4_netmask_length  = var.ipv4_netmask_length
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy
 

  tags = {
    Name = var.tags
  }
}
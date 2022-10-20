variable "tags" {
    type        = map(string)
    default     = {}
    description = "to define tags for the VPC"
}

variable "instance_tenancy" {
    type = string
    description = "it ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated"
    default = "default"
}

variable "cidr_block" {
    description = "to defin the CIDR range for IPAM"
    default = [[""]]
}

# variable "ipv4_ipam_pool_id" {
#     type = number
#     description = "the ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IPAM"
# }

# variable "ipv4_netmask_length" {
#     type = number
#     description = "The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
# }

variable "enable_dns_support" {
    type = bool
    description = "A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
    default = true
}

variable "enable_dns_hostnames" {
    type = bool
    description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
    default = false
}
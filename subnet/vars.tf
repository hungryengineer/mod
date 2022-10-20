variable "private_subnet_cidrs" {
  #type = list(string)
  description = "The IPv4 CIDR block for the subnet."
}

variable "vpc_id" {
  description = "The VPC ID in which this subnet will be created."
  default     = [[""]]
}

variable "azs" {
 #type        = list(string)
 description = "Availability Zones"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "to define tags for the subnet"
}
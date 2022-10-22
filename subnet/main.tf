resource "aws_subnet" "subnets" {
 count             = length(var.subnet_cidrs)
 vpc_id            = var.vpc_id
 cidr_block        = element(var.subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index) # new availability zone per subnet
 tags              = var.tags #"Private Subnet ${count.index + 1}"
}
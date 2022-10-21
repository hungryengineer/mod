resource "aws_internet_gateway" "main" {
  count = length(var.subnet_cidrs) > 0 ? 1 : 0
  vpc_id = var.vpc_id
  tags = var.tags
    
}
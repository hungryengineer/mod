resource "aws_route_table" "main" {
  #count = length(var.subnets) > 0 ? 1 : 0
  vpc_id = var.vpc_id
  tags = var.tags
}
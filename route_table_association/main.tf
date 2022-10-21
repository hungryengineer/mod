resource "aws_route_table_association" "main" {
  #count = length(var.subnets) > 0 ? 1 : 0
  subnet_id = var.subnet_id
  route_table_id = var.route_table_id
}
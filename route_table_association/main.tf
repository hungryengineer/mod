resource "aws_route_table_association" "main" {
  count = length(var.subnet_cidrs) > 0 ? 1 : 0
  subnet_id = element(var.subnet_id, count.index)
  route_table_id = element(var.route_table_id, count.index)
}
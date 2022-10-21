resource "aws_route" "main" {
  count                  = length(var.subnet_cidrs) > 0 ? 1 : 0
  route_table_id         = element(var.route_table_id, count.index)
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = element(var.gateway_id, count.index)

#   timeouts {
#     create = "5m"
#   }
}
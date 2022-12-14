resource "aws_network_acl_rule" "main" {
  count          = length(var.network_acl_id)
  network_acl_id = element(var.network_acl_id, count.index)
  rule_number    = var.rule_number
  egress         = var.egress 
  protocol       = element(var.protocol, count.index)
  rule_action    = var.rule_action
  cidr_block     = element(var.cidr_block, count.index)
  from_port      = element(var.from_port, count.index)
  to_port        = element(var.to_port, count.index)
}
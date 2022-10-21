resource "aws_network_acl" "main" {
  count = length(var.subnet_ids)
  vpc_id = var.vpc_id
  subnet_ids = element(var.subnet_ids, count.index)

#   egress {
#     protocol   = "tcp"
#     rule_no    = 200
#     action     = "allow"
#     cidr_block = "10.3.0.0/18"
#     from_port  = 443
#     to_port    = 443
#   }

#   ingress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "10.3.0.0/18"
#     from_port  = 80
#     to_port    = 80
#   }

  tags = var.tags
}
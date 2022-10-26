# NOTE on Security Groups and Security Group Rules:

# Terraform currently provides both a standalone Security Group Rule resource (a single ingress or egress rule), 
# and a Security Group resource with ingress and egress rules defined in-line. 
# At this time you cannot use a Security Group with in-line rules in conjunction with any Security Group Rule resources. 
# Doing so will cause a conflict of rule settings and will overwrite rules.

resource "aws_security_group_rule" "rules" {
  count = length(var.rules)
  type              = var.type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = var.security_group_id
}




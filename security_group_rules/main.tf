# NOTE on Security Groups and Security Group Rules:

# Terraform currently provides both a standalone Security Group Rule resource (a single ingress or egress rule), 
# and a Security Group resource with ingress and egress rules defined in-line. 
# At this time you cannot use a Security Group with in-line rules in conjunction with any Security Group Rule resources. 
# Doing so will cause a conflict of rule settings and will overwrite rules.

# Error: [WARN] A duplicate Security Group rule was found on (sg-016fd6ebdf3b2c9c9). This may be
# │ a side effect of a now-fixed Terraform issue causing two security groups with    
# │ identical attributes but different source_security_group_ids to overwrite each   
# │ other in the state.

resource "aws_security_group_rule" "rules" {
  count = length(var.rules)
  type              = element(var.type, count.index)
  from_port         = element(var.from_port, count.index)
  to_port           = element(var.to_port, count.index)
  protocol          = element(var.protocol, count.index)
  cidr_blocks       = var.cidr_blocks
  security_group_id = var.security_group_id
}




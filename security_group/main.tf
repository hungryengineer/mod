resource "aws_security_group" "main" {
    name = var.name
    vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.security_group_ingress
    content {

      cidr_blocks      = compact(split(",", lookup(ingress.value, "cidr_blocks", "")))
      description      = lookup(ingress.value, "description", null)
      from_port        = lookup(ingress.value, "from_port", 0)
      to_port          = lookup(ingress.value, "to_port", 0)
      protocol         = lookup(ingress.value, "protocol", "-1")
    }
  }

  dynamic "egress" {
    for_each = var.security_group_egress
    content {
      
      cidr_blocks      = compact(split(",", lookup(egress.value, "cidr_blocks", "")))
      description      = lookup(egress.value, "description", null)
      from_port        = lookup(egress.value, "from_port", 0)
      to_port          = lookup(egress.value, "to_port", 0)
      protocol         = lookup(egress.value, "protocol", "-1")
    }
  }

  tags = var.tags

    lifecycle {
    # Necessary if changing 'name' or 'name_prefix' properties.
    create_before_destroy = true
  }
}
resource "aws_route53_zone" "primary" {
  count = var.create_route53_zone ? 1 : 0
  name = var.name
  dynamic vpc {
    for_each = var.vpc != null ? [var.vpc] : []
    content{
        vpc_id = var.vpc_id
        #vpc_region = vpc.value.vpc_region
    }
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}
resource "aws_route53_zone" "primary" {
  count = var.create_route53_zone ? 1 : 0
  name = var.name
  dynamic vpc {
    for_each = try(var.vpc_id)
    content{
        vpc_id = vpc.value.vpc_id
        #vpc_region = vpc.value.vpc_region
    }
  }
}
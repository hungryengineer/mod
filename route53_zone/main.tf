resource "aws_route53_zone" "primary" {
  count = var.create_route53_zone ? 1 : 0
  name = var.name
}
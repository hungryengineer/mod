resource "aws_route53_zone_association" "primary" {
  zone_id = var.zone_id
  vpc_id  = var.vpc_id
}
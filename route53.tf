resource "aws_route53_record" "strapi" {
  zone_id = "Z06607023RJWXGXD2ZL6M"
  name    = "ksp1.contentecho.in"
  type    = "A"

  alias {
    name                   = aws_lb.strapi_lb.dns_name
    zone_id                = aws_lb.strapi_lb.zone_id
    evaluate_target_health = true
  }
}


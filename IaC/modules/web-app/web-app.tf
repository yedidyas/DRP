# many web-app resources... #

resource "aws_route53_record" "web-app" {
  count = var.is_dr_env ? 0 : 1
  name    = local.web_app_url
  records = [aws_cloudfront_distribution.web_app.domain_name]
  ttl     = "300"
  type    = "CNAME"
  zone_id = data.aws_route53_zone.main_domain.zone_id
}
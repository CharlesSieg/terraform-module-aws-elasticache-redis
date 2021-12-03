#
# Creates CNAME records in Route 53 pointing to the primary and reader endpoints.
# Cannot use A/AAAA because AWS does not manage aliases for ElastiCache.
#

resource "aws_route53_record" "cname_primary" {
  allow_overwrite = true
  count           = var.zone_id == null ? 0 : 1
  name            = "primary-${var.replication_group_id}.${var.domain_name}"
  records         = [aws_elasticache_replication_group.main.primary_endpoint_address]
  ttl             = 60
  type            = "CNAME"
  zone_id         = var.zone_id
}

resource "aws_route53_record" "cname_reader" {
  allow_overwrite = true
  count           = var.zone_id == null ? 0 : 1
  name            = "reader-${var.replication_group_id}.${var.domain_name}"
  records         = [aws_elasticache_replication_group.main.reader_endpoint_address]
  ttl             = 60
  type            = "CNAME"
  zone_id         = var.zone_id
}


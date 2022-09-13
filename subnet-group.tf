resource "aws_elasticache_subnet_group" "this" {
  name       = "${local.cluster_id}-subnet-grp"
  provider   = aws.elasticache
  subnet_ids = var.subnets
  tags       = merge(var.tags, { Name = "${local.cluster_id}-subnet-grp" })
}

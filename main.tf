resource "aws_elasticache_replication_group" "this" {
  apply_immediately          = var.apply_immediately
  automatic_failover_enabled = var.automatic_failover_enabled
  availability_zones         = var.availability_zones
  description                = "ElastiCache replication group for ${local.cluster_id}."
  engine_version             = var.engine_version
  maintenance_window         = var.maintenance_window
  multi_az_enabled           = length(var.availability_zones) > 1
  node_type                  = var.node_type
  num_cache_clusters         = var.number_cache_clusters
  parameter_group_name       = length(var.redis_parameters) > 0 ? aws_elasticache_parameter_group.this[0].id : null
  port                       = var.port
  provider                   = aws.elasticache
  replication_group_id       = local.cluster_id
  security_group_ids         = [aws_security_group.this.id]
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window
  subnet_group_name          = aws_elasticache_subnet_group.this.id
  tags                       = merge(var.tags, { Name = local.cluster_id })
}

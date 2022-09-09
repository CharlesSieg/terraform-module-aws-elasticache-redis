#
# Subnet group
#
resource "aws_elasticache_subnet_group" "main" {
  name       = "${local.cluster_id}-subnet-grp"
  subnet_ids = var.subnets
  tags       = merge(var.tags, { Name = "${local.cluster_id}-subnet-grp" })
}

#
# Redis instance
#
resource "aws_elasticache_replication_group" "main" {
  apply_immediately          = var.apply_immediately
  automatic_failover_enabled = var.automatic_failover_enabled
  availability_zones         = var.availability_zones
  description                = "Terraform-managed ElastiCache replication group for ${local.cluster_id}."
  engine_version             = var.engine_version
  maintenance_window         = var.maintenance_window
  multi_az_enabled           = length(var.availability_zones) > 1
  node_type                  = var.node_type
  num_cache_clusters         = var.number_cache_clusters
  parameter_group_name       = length(var.redis_parameters) > 0 ? aws_elasticache_parameter_group.main[0].id : null
  port                       = var.port
  replication_group_id       = local.cluster_id
  security_group_ids         = [aws_security_group.main.id]
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window
  subnet_group_name          = aws_elasticache_subnet_group.main.id
  tags                       = merge(var.tags, { Name = local.cluster_id })
}

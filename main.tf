resource "aws_elasticache_parameter_group" "main" {
  count       = length(var.parameters) > 0 ? 1 : 0
  description = "Parameter group for ${var.replication_group_id}"
  family      = "redis${replace(var.engine_version, "/\\.[\\d]+$/", "")}" # Strip the patch version.
  name        = var.cluster_id

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_elasticache_subnet_group" "main" {
  name       = var.replication_group_id
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "main" {
  apply_immediately             = var.apply_immediately
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  auth_token                    = var.auth_token
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  automatic_failover_enabled    = var.automatic_failover_enabled
  availability_zones            = var.availability_zones
  cluster_mode                  = var.cluster_mode
  engine                        = "redis"
  engine_version                = var.engine_version
  final_snapshot_identifier     = var.final_snapshot_identifier
  global_replication_group_id   = var.global_replication_group_id
  kms_key_id                    = var.kms_key_id
  maintenance_window            = var.maintenance_window
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.node_type
  notification_topic_arn        = var.notification_topic_arn
  number_cache_clusters         = var.number_cache_clusters
  parameter_group_name          = length(var.parameters) > 0 ? aws_elasticache_parameter_group.main.name : var.parameter_group_name
  port                          = var.port
  replication_group_description = "Redis replication group for ${var.replication_group_id}"
  replication_group_id          = var.replication_group_id
  security_group_ids            = [aws_security_group.main.id]
  snapshot_arns                 = var.snapshot_arns
  snapshot_name                 = var.snapshot_name
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  subnet_group_name             = aws_elasticache_subnet_group.main.name
  tags                          = merge(var.tags, { Name = var.replication_group_id })
  transit_encryption_enabled    = var.transit_encryption_enabled
}

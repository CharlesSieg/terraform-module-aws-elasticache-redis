resource "aws_elasticache_parameter_group" "main" {
  count       = length(var.redis_parameters) > 0 ? 1 : 0
  description = "Terraform-managed ElastiCache parameter group for ${local.cluster_id}."
  family      = "redis${replace(var.engine_version, "/\\.[\\d]+$/", "")}" # Strip the patch version from redis_version var
  name        = "${local.cluster_id}-redis-parameter-group"

  dynamic "parameter" {
    for_each = var.redis_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = false
  }

  tags = merge(var.tags, {
    Name = "${local.cluster_id}-redis-parameter-group"
  })
}


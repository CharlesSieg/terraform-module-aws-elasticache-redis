output "arn" {
  description = "The ARN of the created ElastiCache Cluster."
  value       = aws_elasticache_replication_group.main.arn
}

output "engine_version_actual" {
  description = "The running version of the cache engine."
  value       = aws_elasticache_replication_group.main.engine_version_actual
}

output "cluster_enabled" {
  description = "Indicates if cluster mode is enabled."
  value       = aws_elasticache_replication_group.main.cluster_enabled
}

output "configuration_endpoint_address" {
  description = "The address of the replication group configuration endpoint when cluster mode is enabled."
  value       = aws_elasticache_replication_group.main.configuration_endpoint_address
}

output "id" {
  description = "The ID of the ElastiCache Replication Group."
  value       = aws_elasticache_replication_group.main.id
}

output "member_clusters" {
  description = "The identifiers of all the nodes that are part of this replication group."
  value       = aws_elasticache_replication_group.main.member_clusters
}

output "primary_endpoint_address" {
  description = "The address of the endpoint for the primary node in the replication group, if the cluster mode is disabled."
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "The address of the endpoint for the reader node in the replication group, if the cluster mode is disabled."
  value       = aws_elasticache_replication_group.main.reader_endpoint_address
}

output "security_group_id" {
  description = "ID of the security group which manages access to the cluster."
  value       = aws_security_group.main.id
}

output "subnet_group_name" {
  description = "Name of the subnet group for this cluster."
  value       = aws_elasticache_subnet_group.main.name
}

output "tags_all" {
  description = "Map of tags assigned to the cluster."
  value       = aws_elasticache_replication_group.main.tags_all
}

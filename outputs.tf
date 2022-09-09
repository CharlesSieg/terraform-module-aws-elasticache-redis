output "id" {
  value = aws_elasticache_replication_group.main.id
}

output "port" {
  value = var.port
}

output "primary_endpoint" {
  value = aws_elasticache_replication_group.main.primary_endpoint_address
}

output "reader_endpoint" {
  value = aws_elasticache_replication_group.main.reader_endpoint_address
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "subnet_group_name" {
  value = aws_elasticache_subnet_group.main.name
}

output "id" {
  value = aws_elasticache_replication_group.this.id
}

output "port" {
  value = var.port
}

output "primary_endpoint" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "reader_endpoint" {
  value = aws_elasticache_replication_group.this.reader_endpoint_address
}

output "security_group_id" {
  value = aws_security_group.this.id
}

output "subnet_group_name" {
  value = aws_elasticache_subnet_group.this.name
}

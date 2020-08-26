###################################################################
# SECURITY GROUPS
###################################################################

#
# Create the single security group to manage traffic to ElastiCache.
#
resource "aws_security_group" "cache_sg" {
  name   = "${var.environment}-${var.app_name}-cache-sg"
  vpc_id = var.vpc_id

  tags = {
    Application = var.app_name
    Billing     = var.environment
    Environment = var.environment
    Name        = "${var.environment}-${var.app_name}-cache-sg"
    Terraform   = true
  }
}

#
# Create all of the rules for this security group.
#
resource "aws_security_group_rule" "cache_egress_all" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.cache_sg.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "cache_ingress_redis" {
  cidr_blocks       = [var.ingress_cidr_block]
  from_port         = 6379
  protocol          = "-1"
  security_group_id = aws_security_group.cache_sg.id
  to_port           = 6379
  type              = "ingress"
}

###################################################################
# REDIS
###################################################################

resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.environment}-${var.app_name}"
  subnet_ids = var.private_subnets
}

resource "aws_elasticache_replication_group" "redis" {
  engine                        = "redis"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = 1
  parameter_group_name          = "default.redis5.0"
  port                          = 6379
  replication_group_description = "Redis replica group for ${var.environment}-${var.app_name}-redis"
  replication_group_id          = "${var.environment}-${var.app_name}-redis"
  security_group_ids            = [aws_security_group.cache_sg.id]
  subnet_group_name             = aws_elasticache_subnet_group.redis.name
}

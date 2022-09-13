resource "aws_security_group" "this" {
  description = "ElastiCache security group for ${local.cluster_id}."
  name        = "${local.cluster_id}-sg"
  provider    = aws.elasticache
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${local.cluster_id}-sg"
  })
}

resource "aws_security_group_rule" "ingress_security_groups" {
  count                    = length(var.allowed_security_groups)
  from_port                = var.port
  protocol                 = "tcp"
  provider                 = aws.elasticache
  security_group_id        = aws_security_group.this.id
  source_security_group_id = element(var.allowed_security_groups, count.index)
  to_port                  = var.port
  type                     = "ingress"
}

resource "aws_security_group_rule" "ingress_cidr_blocks" {
  for_each = { for rule in var.security_group_ingress : rule.port => rule }

  cidr_blocks       = each.value.cidr_blocks
  from_port         = each.value.port
  protocol          = "tcp"
  provider          = aws.elasticache
  security_group_id = aws_security_group.this.id
  to_port           = each.value.port
  type              = "ingress"
}

resource "aws_security_group" "main" {
  description = "Terraform-managed ElastiCache security group for ${local.cluster_id}."
  name        = "${local.cluster_id}-sg"
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${local.cluster_id}-sg"
  })
}

resource "aws_security_group_rule" "sg_ingress" {
  count                    = length(var.allowed_security_groups)
  from_port                = var.port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.main.id
  source_security_group_id = element(var.allowed_security_groups, count.index)
  to_port                  = var.port
  type                     = "ingress"
}

resource "aws_security_group_rule" "cidr_ingress" {
  count             = length(var.allowed_cidrs) > 0 ? 1 : 0
  cidr_blocks       = var.allowed_cidrs
  from_port         = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.main.id
  to_port           = var.port
  type              = "ingress"
}

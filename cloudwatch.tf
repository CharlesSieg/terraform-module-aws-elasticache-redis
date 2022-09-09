#
# CloudWatch alarms
#

resource "aws_cloudwatch_metric_alarm" "cache_cpu" {
  alarm_actions       = var.alarm_actions
  alarm_description   = "Redis cluster CPU utilization"
  alarm_name          = "${local.cluster_id}-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  depends_on          = [aws_elasticache_replication_group.main]
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  ok_actions          = var.ok_actions
  period              = 300
  statistic           = "Average"
  tags                = merge(var.tags, { Name = "${local.cluster_id}-cpu-utilization" })
  threshold           = var.alarm_cpu_threshold_percent

  dimensions = {
    CacheClusterId = local.cluster_id
  }
}

resource "aws_cloudwatch_metric_alarm" "cache_memory" {
  alarm_actions       = var.alarm_actions
  alarm_description   = "Average memory usage over last 5 minutes higher than ${var.alarm_memory_threshold_percentage}"
  alarm_name          = "${local.cluster_id}-memory-usage"
  comparison_operator = "GreaterThanThreshold"
  depends_on          = [aws_elasticache_replication_group.main]
  evaluation_periods  = 1
  metric_name         = "DatabaseMemoryUsagePercentage"
  namespace           = "AWS/ElastiCache"
  ok_actions          = var.ok_actions
  period              = 300
  statistic           = "Average"
  tags                = merge(var.tags, { Name = "${local.cluster_id}-memory-usage" })
  threshold           = var.alarm_memory_threshold_percentage

  dimensions = {
    CacheClusterId = local.cluster_id
  }
}

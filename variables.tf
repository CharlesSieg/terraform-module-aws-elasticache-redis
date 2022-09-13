variable "apply_immediately" {
  default     = true
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
  type        = bool
}

variable "alarm_actions" {
  default     = []
  description = "Alarm action list"
  type        = list(string)
}

variable "alarm_cpu_threshold_percent" {
  default     = 75
  description = "CPU threshold alarm level"
  type        = number
}

variable "alarm_memory_threshold_percentage" {
  default     = 80
  description = "Ram threshold alarm level"
  type        = number
}

variable "allowed_cidrs" {
  default     = []
  description = "A list of CIDR blocks to allow access to."
  type        = list(string)
}

variable "allowed_security_groups" {
  default     = []
  description = "A list of security group ID's to allow access to."
  type        = list(string)
}

variable "availability_zones" {
  default     = []
  description = ""
  type        = list(string)
}
variable "automatic_failover_enabled" {
  default     = true
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
  type        = bool
}

variable "engine_version" {
  default     = "6.x"
  description = "Redis version to use."
  type        = string
}

variable "environment" {
  description = "env to deploy into, should typically dev/staging/prod"
  type        = string
}

variable "maintenance_window" {
  default     = "fri:08:00-fri:09:00"
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period"
  type        = string
}

variable "name" {
  description = "Name for the Redis replication group i.e. UserObject"
  type        = string
}

variable "node_type" {
  default     = "cache.t2.small"
  description = "Instance type for the redis cluster that is used to store VC5 session state."
  type        = string
}

variable "number_cache_clusters" {
  default     = 2
  description = "Number of redis shards to launch in the VC5 session state redis cluster."
  type        = number
}

variable "ok_actions" {
  default     = []
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Number (ARN)"
  type        = list(string)
}

variable "port" {
  default = 6379
  type    = number
}

variable "redis_parameters" {
  default     = []
  description = "additional parameters modifyed in parameter group"
  type        = list(string)
}

variable "security_group_ingress" {
  default = [{
    cidr_blocks = []
    port        = 0
  }]
  description = "A list of ports and CIDRs to allow ingress from."
  type = set(object({
    cidr_blocks = list(string)
    port        = number
  }))
}

variable "snapshot_retention_limit" {
  default     = 0
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes"
  type        = number
}

variable "snapshot_window" {
  default     = ""
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period"
  type        = string
}

variable "subnets" {
  description = "List of VPC Subnet IDs for the cache subnet group"
  type        = list(string)
}

variable "tags" {
  default     = {}
  description = "Tags for redis nodes"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

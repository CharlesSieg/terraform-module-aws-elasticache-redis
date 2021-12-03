variable "additional_security_groups" {
  default     = []
  description = "A list of Security Group IDs to allow access to."
  type        = string
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
  description = "A list of CIDRs to allow access to."
  type        = list(string)
}

variable "apply_immediately" {
  default     = true
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
  type        = bool
}

variable "at_rest_encryption_enabled" {
  default     = true
  description = "Whether to enable encryption at rest."
  type        = bool
}

variable "auth_token" {
  default     = ""
  description = "The password used to access a password-protected server. Can be specified only if transit_encryption_enabled = true."
  type        = string
}

variable "auto_minor_version_upgrade" {
  default     = true
  description = "Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window."
  type        = bool
}

variable "automatic_failover_enabled" {
  default     = false
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, number_cache_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups."
  type        = bool
}

variable "availability_zones" {
  default     = []
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important."
  type        = list(string)
}

variable "cluster_mode" {
  default     = false
  description = "Create a native Redis cluster. automatic_failover_enabled must be set to true. Note that enabling this does not enable cluster mode, i.e., data sharding, which requires using a parameter group that has the parameter cluster-enabled set to true."
  type        = bool
}

variable "domain_name" {
  default     = null
  description = "The domain name used in Route 53 CNAME entrires."
  type        = string
}

variable "engine_version" {
  default     = "6.x"
  description = "The version number of the cache engine to be used for the cache clusters in this replication group. If the version is 6 or higher, only the major version can be set, e.g., 6.x, otherwise, specify the full version desired, e.g., 5.0.6."
  type        = string
}

variable "final_snapshot_identifier" {
  default     = ""
  description = "The name of the final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made."
  type        = string
}

variable "global_replication_group_id" {
  default     = ""
  description = "The ID of the global replication group to which this replication group should belong. If this parameter is specified, the replication group is added to the specified global replication group as a secondary replication group; otherwise, the replication group is not part of any global replication group. If global_replication_group_id is set, the num_node_groups parameter of the cluster_mode block cannot be set."
  type        = string
}

variable "kms_key_id" {
  default     = ""
  description = "The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if at_rest_encryption_enabled = true."
  type        = string
}

variable "maintenance_window" {
  default     = "fri:08:00-fri:09:00"
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period."
  type        = string
}

variable "multi_az_enabled" {
  default     = false
  description = "Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic_failover_enabled must also be enabled."
  type        = bool
}

variable "node_type" {
  default     = "cache.t4g.micro"
  description = "The instance class used."
  type        = string
}

variable "notification_topic_arn" {
  default     = null
  description = "ARN of an SNS topic to send ElastiCache notifications to."
  type        = string
}

variable "number_cache_clusters" {
  default     = 1
  description = "The number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2. Updates will occur before other modifications. One of number_cache_clusters or cluster_mode is required."
  type        = number
}

variable "ok_actions" {
  default     = []
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Number (ARN)"
  type        = list(string)
}

variable "parameter_group_name" {
  default     = "default.redis5.0"
  description = "The name of the parameter group to associate with this cache cluster."
  type        = string
}

variable "parameters" {
  default     = []
  description = "A list of ElastiCache parameters to apply. Supplying this list overrides use of an existing parameter group specified by parameter_group_name."
  type        = list(string)
}

variable "port" {
  default     = 6379
  description = "The port number on which each of the cache nodes will accept connections."
  type        = number
}

variable "replication_group_id" {
  description = "Required. The replication group identifier. This parameter is stored as a lowercase string."
  type        = string
}

variable "snapshot_arns" {
  default     = []
  description = "A list of Amazon Resource Names (ARNs) that identify Redis RDB snapshot files stored in Amazon S3. The names object names cannot contain any commas."
  type        = list(string)
}

variable "snapshot_name" {
  default     = ""
  description = "The name of a snapshot from which to restore data into the new node group."
  type        = string
}

variable "snapshot_retention_limit" {
  default     = 0
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. If the value is set to zero (0), backups are turned off."
  type        = number
}

variable "snapshot_window" {
  default     = ""
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period."
  type        = string
}

variable "subnet_ids" {
  description = "Required. List of VPC Subnet IDs for the cache subnet group."
  type        = list(string)
}

variable "tags" {
  default     = {}
  description = "Key-value map of resource tags."
  type        = map(string)
}

variable "transit_encryption_enabled" {
  default     = false
  description = "Whether to enable encryption in transit."
  type        = bool
}

variable "vpc_id" {
  description = "Required. ID of the VPC in which this cluster is provisioned."
  type        = string
}

variable "zone_id" {
  default     = null
  description = "The zone ID in which Route 53 entries are created."
  type        = string
}

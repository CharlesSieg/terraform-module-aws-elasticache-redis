variable "app_name" {
  description = "The app name used for tagging infrastructure."
  type        = string
}

variable "environment" {
  description = "The environment in which this infrastructure will be provisioned."
  type        = string
}

variable "ingress_cidr_block" {
  description = "The CIDR block on which to allow ingress."
  type        = string
}

variable "private_subnets" {
  description = "Private subnets which contain data resources."
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "cyf-youtube-database"
}

variable "engine_version" {
  description = "Engine version for the RDS instance"
  type        = string
  default     = "15.5"
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "inital_db"
}

variable "master_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = "postgres"
}

variable "master_password" {
  description = "Master password for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of storage in gibibytes to allocate to the DB instance"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "backup_retention_period" {
  description = "Number of days to retain automatic backups"
  type        = number
  default     = 0
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs for the RDS instance"
  type        = list(string)
}

variable "storage_encryption" {
  description = "Flag to enable or disable storage encryption"
  type        = bool
  default     = true
}

variable "performance_insights_enabled" {
  description = "Enable/Disable Performance Insights for the RDS instance"
  type        = bool
  default     = true
}

variable "copy_tags_to_snapshot" {
  description = "Whether to copy tags from the RDS instance to snapshots"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "ID of the AWS KMS key to use for storage encryption"
  type        = string
  default     = "aws/rds"
}

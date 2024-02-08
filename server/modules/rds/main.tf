provider "aws" {
  region = var.region
}

resource "aws_db_instance" "cyf-youtube-tf-db" {
  identifier            = var.db_instance_identifier
  allocated_storage     = var.allocated_storage
  engine                = "postgres"
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  username              = var.master_username
  password              = var.master_password
  parameter_group_name  = "default.postgres15"
  publicly_accessible   = true
  storage_type          = var.storage_type
  skip_final_snapshot   = true
  multi_az              = false
  backup_retention_period = var.backup_retention_period
  vpc_security_group_ids = var.vpc_security_group_ids
  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  performance_insights_enabled = var.performance_insights_enabled


  storage_encrypted     = var.storage_encryption

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      enabled_cloudwatch_logs_exports,
    ]
  }
}


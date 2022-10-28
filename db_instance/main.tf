resource "aws_db_instance" "main" {
  count = var.create_db_instance ? 1 : 0

  identifier        = var.identifier
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
#   storage_encrypted = var.storage_encrypted
#   kms_key_id        = var.kms_key_id
#   license_model     = var.license_model

#   db_name                             = var.db_name
  username                            = var.username
  password                            = var.password
  port                                = var.port
#   domain                              = var.domain
#   domain_iam_role_name                = var.domain_iam_role_name
#   iam_database_authentication_enabled = var.iam_database_authentication_enabled

#   vpc_security_group_ids = var.vpc_security_group_ids
#   db_subnet_group_name   = var.db_subnet_group_name
#   parameter_group_name   = var.parameter_group_name
#   option_group_name      = var.option_group_name
#   network_type           = var.network_type

  availability_zone   = element(var.availability_zone, count.index)
  multi_az            = var.multi_az
#   iops                = var.iops
  publicly_accessible = var.publicly_accessible
#   ca_cert_identifier  = var.ca_cert_identifier

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null # dependency chaining for args 
#   performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null

#   replicate_source_db     = var.replicate_source_db
#   replica_mode            = var.replica_mode
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window # Must not overlap with maintenance_window.
#   max_allocated_storage   = var.max_allocated_storage
#   monitoring_interval     = var.monitoring_interval
#   monitoring_role_arn     = var.monitoring_interval > 0 ? local.monitoring_role_arn : null

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  deletion_protection      = var.deletion_protection
  delete_automated_backups = var.delete_automated_backups

  dynamic "restore_to_point_in_time" {
    for_each = var.restore_to_point_in_time != null ? [var.restore_to_point_in_time] : []

    content {
      restore_time                             = lookup(restore_to_point_in_time.value, "restore_time", null)
    #   source_db_instance_automated_backups_arn = lookup(restore_to_point_in_time.value, "source_db_instance_automated_backups_arn", null)
      source_db_instance_identifier            = lookup(restore_to_point_in_time.value, "source_db_instance_identifier", null)
      source_dbi_resource_id                   = lookup(restore_to_point_in_time.value, "source_dbi_resource_id", null)
      use_latest_restorable_time               = lookup(restore_to_point_in_time.value, "use_latest_restorable_time", null)
    }
  }

#   dynamic "s3_import" {
#     for_each = var.s3_import != null ? [var.s3_import] : []

#     content {
#       source_engine         = "mysql"
#       source_engine_version = s3_import.value.source_engine_version
#       bucket_name           = s3_import.value.bucket_name
#       bucket_prefix         = lookup(s3_import.value, "bucket_prefix", null)
#       ingestion_role        = s3_import.value.ingestion_role
#     }
#   }

  tags = var.tags
}
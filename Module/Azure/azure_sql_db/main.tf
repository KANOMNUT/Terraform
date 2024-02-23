resource "azurerm_mssql_database" "name" {
  name               = var.sql_db_name
  server_id          = var.sql_server_id
  elastic_pool_id    = var.elastic_pool_id
  sku_name           = var.sku_name
  geo_backup_enabled = var.geo_backup_enabled

  dynamic "maintainance_configuration" {
    for_each = var.used_elastic_pool == false ? [1] : []
    content {
      name = "SQL_SoutheastAsia_DB_1"
    }
  }
  min_capacity         = var.min_capacity
  max_size_gb          = var.max_size_gb
  storage_account_type = var.storage_account_type
  zone_redundant       = var.zone_redundant
  dynamic "threat_detection_policy" {
    for_each = var.threat_detection_enabled == true ? [1] : []
    content {
      state                      = "Enabled"
      disabled_alerts            = var.detection_disabled_alerts
      email_account_admins       = var.detection_email_admin
      email_addresses            = var.detection_email_alert
      retention_days             = var.detection_retention_days
      storage_account_access_key = var.detection_storage_access_key
      storage_endpoint           = var.detection_storage_endpoint
    }
  }
  dynamic "short_term_retention_policy" {
    for_each = var.short_term_enabled == true ? [1] : []
    content {
      retention_days           = var.short_term_retention_days
      backup_interval_in_hours = var.short_term_interval
    }
  }
  dynamic "long_term_retention_policy" {
    for_each = var.long_term_enabled == true ? [1] : []
    content {
      weekly_retention  = var.long_term_weekly_retention
      monthly_retention = var.long_term_monthly_retention
      yearly_retention  = var.long_term_yearly_retention
      week_of_year      = var.long_term_backup_week
    }
  }
  tags = var.tags
}

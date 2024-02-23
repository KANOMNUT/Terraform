resource "azurerm_service_plan" "appserviceplan" {
  name = "ASP-Windows-${var.name}"
  resource_group_name = var.resource_group_name
  location = var.location
  os_type = "Windows"
  sku_name = var.sku_name
  worker_count = var.worker_count
  zone_balancing_enabled = var.zone_balancing_enabled
  tags = var.tags
}

resource "azurerm_windows_function_app" "name" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  service_plan_id = azurerm_service_plan.appserviceplan.id
  storage_account_name = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  site_config {
    application_stack {
      dotnet_version = var.site_config.dotnet_version
      java_version = var.site_config.java_version
      node_version = var.site_config.node_version
      powershell_core_version = var.site_config.powershell_core_version
    }
    app_service_logs {
      disk_quota_mb = var.site_config.app_logs_disk_quota
      retention_period_days = var.site_config.app_logs_retention
    }
  }
  dynamic "backup" {
    for_each = var.backup_enabled == true ? [1] : []
    content {
      name = "${var.name}-backup"
      storage_account_url = var.backup.storage_account_sas
      schedule {
        frequency_interval = var.backup.interval
        frequency_unit = var.backup.frequency_unit
        retention_period_days = var.backup.retention
        start_time = var.backup.start_time
      }
    }
  }
  virtual_network_subnet_id = var.virtual_network_subnet_id
  tags = var.tags
}
resource "azurerm_service_plan" "appserviceplan" {
  name                   = "ASP-Linux-${var.name}"
  resource_group_name    = var.resource_group_name
  location               = var.location
  os_type                = "Linux"
  sku_name               = var.sku_name
  worker_count           = var.worker_count
  zone_balancing_enabled = var.zone_balancing_enabled
  tags                   = var.tags
}

resource "azurerm_linux_function_app" "functionapp" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  service_plan_id            = azurerm_service_plan.appserviceplan.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  site_config {
    application_stack {
      dynamic "docker" {
        for_each = var.stack_choice == "docker" ? [1] : []
        content {
          registry_url = var.docker_registry_url
          image_name = var.docker_image_name
          image_tag = var.docker_image_tag
          registry_username = var.docker_registry_username
          registry_password = var.docker_registry_password
        }
      }
      dotnet_version          = var.stack_choice == "dotnet" ? var.dotnet_version : null
      java_version            = var.stack_choice == "java" ? var.java_version : null
      node_version            = var.stack_choice == "node" ? var.node_version : null
      python_version          = var.stack_choice == "python" ? var.python_version : null
      powershell_core_version = var.stack_choice == "powershell" ? var.powershell_core_version : null
    }
    app_service_logs {
      disk_quota_mb         = var.app_service_logs_enabled == true ? var.app_logs_disk_quota : null
      retention_period_days = var.app_service_logs_enabled == true ? var.app_logs_retention : null
    }
  }
  dynamic "backup" {
    for_each = var.backup_enabled == true ? [1] : []
    content {
      name                = "${var.name}-backup"
      storage_account_url = var.backup.storage_account_sas
      schedule {
        frequency_interval    = var.backup.interval
        frequency_unit        = var.backup.frequency_unit
        retention_period_days = var.backup.retention
        start_time            = var.backup.start_time
      }
    }
  }
  virtual_network_subnet_id = var.virtual_network_subnet_id
  tags                      = var.tags
}

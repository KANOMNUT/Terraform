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

resource "azurerm_linux_web_app" "webapplinux" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
    application_stack {
      docker_image_name        = var.stack_choice == "docker" ? var.docker.image_name : null
      docker_registry_url      = var.stack_choice == "docker" ? var.docker.registry_url : null
      docker_registry_username = var.stack_choice == "docker" ? var.docker.registry_username : null
      docker_registry_password = var.stack_choice == "docker" ? var.docker.registry_password : null
      dotnet_version           = var.stack_choice == "dotnet" ? var.dotnet_version : null
      go_version               = var.stack_choice == "golang" ? var.go_version : null
      java_server_version      = var.stack_choice == "java" ? var.java.server_version : null
      java_server              = var.stack_choice == "java" ? var.java.server : null
      java_version             = var.stack_choice == "java" ? var.java.version : null
      node_version             = var.stack_choice == "node" ? var.node_version : null
      php_version              = var.stack_choice == "php" ? var.php_version : null
      python_version           = var.stack_choice == "python" ? var.python_version : null
      ruby_version             = var.stack_choice == "ruby" ? var.ruby_version : null
    }
  }
  dynamic "backup" {
    for_each = var.backup_enabled == true ? [1] : []
    content {
      name                = "${var.name}-backup"
      storage_account_url = var.storage_account_sas
      schedule {
        frequency_interval    = var.interval
        frequency_unit        = var.frequency_unit
        retention_period_days = var.retention
        start_time            = var.start_time
      }
    }
  }
  dynamic "logs" {
    for_each = var.logs_enabled == true ? [1] : []
    content {
      detailed_error_messages = var.logs.detailed_error_messages
      failed_request_tracing  = var.logs.failed_request_tracing
      http_logs {
        azure_blob_storage {
          sas_url           = var.logs.http_logs_blob_sas_url
          retention_in_days = var.logs.http_logs_retention
        }
      }
      application_logs {
        file_system_level = var.logs.file_system_level
        azure_blob_storage {
          level             = var.logs.application_logs_blob_level
          retention_in_days = var.logs.application_logs_blob_retention
          sas_url           = var.logs.application_logs_blob_sas_url
        }
      }
    }
  }
  virtual_network_subnet_id = var.virtual_network_subnet_id
  tags                      = var.tags
  depends_on                = [azurerm_service_plan.appserviceplan]
}

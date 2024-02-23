terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}

provider "azurerm" {
    features {}
}

module "WebAppService" {
  source = "../../../../Terraform Module/App Service/Linux/Web App"
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  sku_name = var.sku_name
  worker_count = var.worker_count
  zone_balancing_enabled = var.zone_balancing_enabled
  stack_choice = var.stack_choice
  node_version = var.node_version
  logs_enabled = var.logs_enabled
  logs = var.logs
  backup_enabled = var.backup_enabled
  storage_account_sas = var.storage_account_sas
  interval = var.interval
  frequency_unit = var.frequency_unit
  retention = var.retention
  start_time = var.start_time
  tags = var.tags
}
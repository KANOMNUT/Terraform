provider "azurerm" {
  features {}
}
terraform {
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
        version = "3.85.0"
    }
  }
}

module "FunctionApp" {
  source = "../../../Terraform Module/App Service/Linux/Function App"
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name
  sku_name = var.sku_name
  worker_count = var.worker_count
  zone_balancing_enabled = var.zone_balancing_enabled
  storage_account_name = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  stack_choice = var.stack_choice
  docker_image_name = var.docker_image_name
  docker_image_tag = var.docker_image_tag
  docker_registry_url = var.docker_registry_url
  app_service_logs_enabled = var.app_service_logs_enabled
  backup_enabled = var.backup_enabled
  tags = var.tags
}
provider "azurerm" {
  features {}
}

terraform {
  # backend "azurerm" {
    # access_key = "$STORAGE_ACCOUNT_KEY"
    # resource_group_name = "rg-sea-kanomnutt"
    # storage_account_name = "terraformstatekanomnutt"
    # container_name = "tfstate"
    # key = "az-rg2.tfstate"
  # }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
  }
}

module "tm_profile" {
  source = "./module"
  tm_name = var.tm_name
  tm_rg = var.tm_rg
  tm_route_method = var.tm_route_method
  tm_traffic_view = var.tm_traffic_view
  relative_name = var.relative_name
  ttl = var.ttl
  protocol = var.protocol
  port = var.port
  path = var.path
  tags = var.tags
}
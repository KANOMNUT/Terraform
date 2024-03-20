provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-sea-kanomnutt"
    storage_account_name = "stseakanomnutttf"
    container_name       = "tfstate"
    key                  = "az-aks.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.85.0"
    }
  }
}

module "az_aks_cluster" {
  source                             = "../../Module/Azure/aks/cluster"
  aks_name                           = var.aks_name
  location                           = var.location
  resource_group_name                = var.resource_group_name
  kubernetes_version                 = var.kubernetes_version
  sku_tier                           = var.sku_tier
  enable_ingress_application_gateway = var.enable_ingress_application_gateway
  image_cleaner_interval_hours       = var.image_cleaner_interval_hours
  azure_ad                           = var.azure_ad
  vnet_rg                            = var.vnet_rg
  aks_vnet_name                      = var.aks_vnet_name
  aks_subnet_name                    = var.aks_subnet_name
  storage_profile                    = var.storage_profile
  agent_pool                         = var.agent_pool
  tags                               = var.tags
}


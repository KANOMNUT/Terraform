terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.85.0"
    }
  }
    backend "azurerm" {
        resource_group_name = "rg-sea-kanomnutt"
        storage_account_name = "stseakanomnutttf"
        container_name = "tfstate"
        key = "test_pipeline.tfstate"
    }
}

provider "azurerm" {
  features {}
}

module "azure_resource_group" {
  source = "../../../Terraform Module/Azure/resource_group"
  name = var.rg_name
  location = var.location
  tags = var.tags
}

module "azure_vnet" {
  source = "../../../Terraform Module/Azure/VNET"
  name = var.vnet_name
  location = var.location
  resource_group_name = var.rg_name
  address_space = var.address_space
  subnet = var.subnet
  tags = var.tags
  depends_on = [ module.azure_resource_group ]
}
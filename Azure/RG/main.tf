provider "azurerm" {
  features {}
  # skip_provider_registration = true
  # subscription_id = "$ARM_SUBSCRIPTION_ID"
  # client_id = "$ARM_CLIENT_ID"
  # client_secret = "$ARM_CLIENT_SECRET"
  # tenant_id = "$ARM_TENANT_ID"
}

terraform {
  backend "azurerm" {
    # access_key = "$STORAGE_ACCOUNT_KEY"
    resource_group_name = "rg-sea-kanomnutt"
    storage_account_name = "terraformstatekanomnutt"
    container_name = "tfstate"
    key = "az-rg2.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
   azuread = {
      source = "hashicorp/azuread"
      version = "1.4.0"
    }
  }
}

resource "azurerm_resource_group" "az_rg" {
  count = length(var.rg)
  name = var.rg[count.index].name
  location = var.rg[count.index].location
  tags = var.rg[count.index].tags
}

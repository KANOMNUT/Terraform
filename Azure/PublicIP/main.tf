provider "azurerm" {
  features {}
  # skip_provider_registration = true
  # subscription_id = "$SUBSCRIPTION_ID"
  # client_id = "$CLIENT_ID"
  # client_secret = "$CLIENT_SECRET"
  # tenant_id = "$TENANT_ID"
}

terraform {
  backend "azurerm" {
    # subscription_id = "$SUBSCRIPTION_ID"
    # client_id = "$CLIENT_ID"
    # client_secret = "$CLIENT_SECRET"
    # tenant_id = "$TENANT_ID"
    resource_group_name = "rg-sea-kanomnutt"
    storage_account_name = "terraformstatekanomnutt"
    container_name = "tfstate"
    key = "az-pip.tfstate"
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

resource "azurerm_public_ip" "kanomnutt_pub" {
    count = length(var.pip)
    name = var.pip[count.index].name
    location = var.pip[count.index].location
    resource_group_name = var.pip[count.index].resource_group_name
    allocation_method = var.pip[count.index].allocation_method
    tags = var.pip[count.index].tags
    sku = var.pip[count.index].sku
    ip_version = var.pip[count.index].ip_version
}
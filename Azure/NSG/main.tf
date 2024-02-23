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
    key = "az-nsg.tfstate"
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

resource "azurerm_network_security_group" "kanomnutt_nsg" {
  name = var.nsg_name
  location = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_network_security_rule" "nsg_rule" {
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.kanomnutt_nsg.name
  name = "AllowSSH"
  priority = 100
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefix = "*"
  destination_address_prefix = "*"

}
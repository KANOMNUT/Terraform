provider "azuread" {
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
    key = "az-sp.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
   azuread = {
      source = "hashicorp/azuread"
      version = "2.37.2"
    }
  }
}

resource "azuread_application" "example" {
  display_name = "terraform-app"
}

resource "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id
  depends_on = [
    azuread_application.example
  ]
}

resource "time_rotating" "example" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "example" {
  service_principal_id = azuread_service_principal.example.object_id
  rotate_when_changed = {
    rotation = time_rotating.example.id
  }
  depends_on = [
    azuread_service_principal.example
  ]
}
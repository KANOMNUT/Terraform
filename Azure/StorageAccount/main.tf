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
    key = "az-sta.tfstate"
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
# Create Storage Account
resource "azurerm_storage_account" "kanomnutt_sa" {
  name = var.sa_name
  resource_group_name = var.resource_group_name
  location = var.location
  access_tier = var.access_tier
  account_replication_type = var.account_replication_type
  account_kind = var.account_kind
  account_tier = var.account_tier
  min_tls_version = var.tls_version
  allow_blob_public_access = var.blob_public_access
}

# Create Container Storage (S3)
resource "azurerm_storage_container" "sa_container" {
  name = var.container_name
  storage_account_name = var.sa_name
  container_access_type = var.container_access_type
  depends_on = [ azurerm_storage_account.kanomnutt_sa ]
}


module "sql_server" {
#  source = "./module/"
  source =   "git@gitlab.com:thanachai.tre/terraform-module//azure-sql"
  sql_name = var.sql_name
  rg = var.rg
  location = var.location
  admin_user = var.admin_user
  tags = var.tags
  ad_admin = var.ad_admin
  admin_object_id = var.admin_object_id
  tenant_id = var.tenant_id
  sql-subnet_id = var.sql-subnet_id
  firewall_rules = var.sql_fw_rule
}

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
    key = "az-sql.tfstate"
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

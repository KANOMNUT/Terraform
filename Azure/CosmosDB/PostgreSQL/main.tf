module "cosmos_pg" {
  source                               = "../../../../Terraform Module/Azure/Azure Cosmos DB/PostgreSQL"
  name                                 = var.name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  administrator_login_password         = var.administrator_login_password
  coordinator_storage_quota_in_mb      = var.coordinator_storage_quota_in_mb
  coordinator_vcore_count              = var.coordinator_vcore_count
  coordinator_public_ip_access_enabled = var.coordinator_public_ip_access_enabled
  node_count                           = var.node_count
  ha_enabled                           = var.ha_enabled
  preferred_primary_zone               = var.preferred_primary_zone
  sql_version                          = var.sql_version
  firewall_rules                       = var.firewall_rules
  users                                = var.users
  tags                                 = var.tags
}

provider "azure" {
  features {}
  skip_provider_registration = true
}

terraform {
  required_providers {
    azure = {
      source  = "hashicorp/azurerm"
      version = "=3.85.0"
    }
  }
}

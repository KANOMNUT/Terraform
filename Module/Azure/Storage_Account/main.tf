resource "azurerm_storage_account" "storage_account" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  account_kind               = var.storage_type
  account_tier               = var.storage_tier
  account_replication_type   = var.storage_replication_type
  access_tier                = var.storage_access_tier
  enable_https_traffic_only  = true
  min_tls_version            = "TLS1_2"
  public_network_access_enabled = true

  network_rules {
    default_action  = "Deny"
    virtual_network_subnet_ids = var.allowed_subnet_ids
    ip_rules = var.ip_rules
  }

  blob_properties  {
    cors_rule {
        allowed_headers = var.cors_allowed_headers
        allowed_methods = var.cors_allowed_methods
        allowed_origins = var.cors_allowed_origins
        exposed_headers = var.cors_exposed_headers
        max_age_in_seconds = var.cors_max_age_in_seconds
    }
    delete_retention_policy {
        days = var.delete_retention_days
    }
    container_delete_retention_policy {
      days = var.container_delete_retention_days
    }
  }

  dynamic "custom_domain" {
    for_each = var.custom_domain_enabled == true ? [1] : []
    content {
      name = var.custom_domain_name
      use_subdomain = var.use_subdomain
    }
  }

  tags = var.tags

}
resource "azurerm_postgresql_flexible_server" "postgresql-flexibleserver" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  version = var.pg_version
  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id
  zone = var.zone

  dynamic "high_availability" {
    for_each = var.enable_high_availability == true ? [1] : []
    content {
      mode                      = var.ha_mode
      standby_availability_zone = var.standby_zone
    }
  }
  storage_mb = var.storage_mb
  sku_name = var.sku_name
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  backup_retention_days = var.backup_retention_days
  administrator_login = var.administrator_login
  administrator_password = var.administrator_password
  authentication {
    active_directory_auth_enabled = true
    password_auth_enabled = true
    tenant_id = var.azuread_tenant_id
  }
  tags = var.tags
}
resource "azurerm_postgresql_flexible_server_active_directory_administrator" "postgresql-flexibleserver-azuread-admin" {
  server_name         = azurerm_postgresql_flexible_server.postgresql-flexibleserver.name
  resource_group_name = var.resource_group_name
  tenant_id = var.azuread_tenant_id
  object_id = ""
  principal_type = ""
  principal_name = ""
  depends_on = [ azurerm_postgresql_flexible_server.postgresql-flexibleserver ]
}

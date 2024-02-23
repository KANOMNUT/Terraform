resource "azurerm_cosmosdb_postgresql_cluster" "cosmos_pg" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  administrator_login_password = var.administrator_login_password
  coordinator_storage_quota_in_mb = var.coordinator_storage_quota_in_mb
  coordinator_vcore_count = var.coordinator_vcore_count
  coordinator_public_ip_access_enabled = var.coordinator_public_ip_access_enabled
  node_count = var.node_count
  ha_enabled = var.ha_enabled
  preferred_primary_zone = var.preferred_primary_zone
  sql_version = var.sql_version
  tags = var.tags
}

resource "azurerm_cosmosdb_postgresql_firewall_rule" "cosmos_pg_fw" {
  cluster_id = azurerm_cosmosdb_postgresql_cluster.cosmos_pg.id
  count = length(var.firewall_rules)
  name = var.firewall_rules[count.index].firewall_rules_name
  start_ip_address = var.firewall_rules[count.index].firewall_rules_start_ip
  end_ip_address = var.firewall_rules[count.index].firewall_rules_end_ip
  depends_on = [ azurerm_cosmosdb_postgresql_cluster.cosmos_pg ]
}

resource "azurerm_cosmosdb_postgresql_role" "cosmos_pg_user"{
  cluster_id = azurerm_cosmosdb_postgresql_cluster.cosmos_pg.id
  count = length(var.users)
  name = var.users[count.index].pg_username
  password = var.users[count.index].pg_password
  depends_on = [ azurerm_cosmosdb_postgresql_cluster.cosmos_pg ]
}

resource "azurerm_traffic_manager_profile" "tm_profile" {
  name = var.tm_name
  resource_group_name = var.tm_rg
  traffic_routing_method = var.tm_route_method
  traffic_view_enabled = var.tm_traffic_view
  dns_config {
    relative_name = var.relative_name
    ttl = var.ttl
  }
  monitor_config {
    protocol = var.protocol
    port = var.port
    path = var.path
  }
  tags = var.tags
}
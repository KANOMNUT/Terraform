resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  custom_network_interface_name = "${var.name}-nic"
  private_dns_zone_group {
    name = var.private_dns_zone_name
    private_dns_zone_ids = var.private_dns_zone_ids
  }
   
  private_service_connection {
    name = var.connection_name
    is_manual_connection = false
    private_connection_resource_id  = var.private_connection_resource_id
    subresource_names = var.connected_resources
  }

  tags = var.tags
  
}
resource "azurerm_resource_group" "az_rg" {
    location = var.location
    name = var.name
    tags = var.tags
}
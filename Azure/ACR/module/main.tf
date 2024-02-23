resource "azurerm_container_registry" "acr" {
  name = var.acr_name
  resource_group_name = var.rg
  location = var.location
  sku = var.sku
  admin_enabled = var.admin_enabled
  tags = var.tags

}

resource "azurerm_container_registry_scope_map" "acr_scope_map" {
  count = length(var.acr_scope_map)
  name = var.acr_scope_map[count.index].name
  container_registry_name = var.acr_name
  resource_group_name = var.rg
  actions = var.acr_scope_map[count.index].actions
  depends_on = [ azurerm_container_registry.acr ]
}

resource "azurerm_container_registry_token" "acr_token" {
  for_each                = { for index, scope_map in var.acr_scope_map : index => scope_map }
  name                    = "${each.value.name}-token"
  container_registry_name = var.acr_name
  resource_group_name     = var.rg
  scope_map_id            = azurerm_container_registry_scope_map.acr_scope_map[each.key].id
  depends_on = [ azurerm_container_registry_scope_map.acr_scope_map ]
}

resource "azurerm_container_registry_token_password" "acr_token_password" {
  for_each = azurerm_container_registry_token.acr_token
  container_registry_token_id = each.value.id

  password1 {}
  password2 {}
  depends_on = [azurerm_container_registry_token.acr_token]
}
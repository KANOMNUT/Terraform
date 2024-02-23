resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {  
    name = "log-${var.name}"
    resource_group_name = var.resource_group_name
    location = var.location
    sku = var.sku
    retention_in_days = var.retention_in_days
    daily_quota_gb = var.daily_quota_gb
    tags = var.tags
}

resource "azurerm_application_insights" "application_insight" {
  name = "appi-${var.name}"
  resource_group_name = var.resource_group_name
  location = var.location
  application_type = var.application_type
  daily_data_cap_in_gb = var.daily_quota_gb
  retention_in_days = var.retention_in_days
  workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id
  tags = var.tags
}
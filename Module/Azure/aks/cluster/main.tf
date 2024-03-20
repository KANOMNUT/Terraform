resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                         = var.aks_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  dns_prefix                   = var.aks_name
  kubernetes_version           = var.kubernetes_version
  automatic_channel_upgrade    = "stable"
  sku_tier                     = var.sku_tier
  image_cleaner_enabled        = true
  image_cleaner_interval_hours = var.image_cleaner_interval_hours
  # node_os_channel_upgrade      = "SecurityPatch"

  azure_active_directory_role_based_access_control {
    managed                = var.azure_ad.rbac_managed
    tenant_id              = var.azure_ad.tenant_id
    admin_group_object_ids = var.azure_ad.rbac_managed == true ? var.azure_ad.admin_group : null
    azure_rbac_enabled     = var.azure_ad.rbac_managed == true ? var.azure_ad.rbac_enabled : null
    client_app_id          = var.azure_ad.rbac_managed == false ? var.azure_ad.client_app_id : null
    server_app_id          = var.azure_ad.rbac_managed == false ? var.azure_ad.server_app_id : null
    server_app_secret      = var.azure_ad.rbac_managed == false ? var.azure_ad.server_app_sevret : null
  }

  identity {
    type = "SystemAssigned"
  }

  storage_profile {
    blob_driver_enabled         = var.storage_profile.blob_driver_enabled
    disk_driver_enabled         = var.storage_profile.disk_driver_enabled
    disk_driver_version         = var.storage_profile.disk_driver_version
    file_driver_enabled         = var.storage_profile.file_driver_enabled
    snapshot_controller_enabled = var.storage_profile.snapshot_controller_enabled
  }

  dynamic "ingress_application_gateway" {
    for_each = var.enable_ingress_application_gateway == true ? [1] : []
    content {
      gateway_name = var.ingress_application_gateway.name
      subnet_id    = var.ingress_application_gateway.subnet_id
    }
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    network_policy    = "azure"
  }

  default_node_pool {
    name    = var.agent_pool.name
    vm_size = var.agent_pool.vm_size
    # vnet_subnet_id               = var.agnet_pool_subnet
    vnet_subnet_id               = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vnet_rg}/providers/Microsoft.Network/virtualNetworks/${var.aks_vnet_name}/subnets/${var.aks_subnet_name}"
    type                         = "VirtualMachineScaleSets"
    kubelet_disk_type            = "OS"
    os_sku                       = var.agent_pool.os_sku
    os_disk_size_gb              = var.agent_pool.os_disk_size_gb
    enable_node_public_ip        = var.agent_pool.enabled_pip
    enable_auto_scaling          = var.agent_pool.enabled_auto_scale
    node_count                   = var.agent_pool.node_count
    max_count                    = var.agent_pool.node_max_count
    min_count                    = var.agent_pool.node_min_count
    max_pods                     = var.agent_pool.max_pods
    zones                        = var.agent_pool.availability_zones
    only_critical_addons_enabled = var.agent_pool.only_critical_addons_enabled
    node_labels                  = var.agent_pool.node_labels
    tags                         = var.tags
  }

  tags = var.tags
}

data "azurerm_subscription" "current" {}

aks_name                     = "aks-sea-kanomnutt"
location                     = "southeastasia"
resource_group_name          = "rg-sea-kanomnutt"
kubernetes_version           = "1.28.3"
sku_tier                     = "Free"
image_cleaner_interval_hours = 24
azure_ad = {
  rbac_managed      = true
  tenant_id         = "ab983f65-a891-4847-ad81-8f3cc25c6d4b"
  admin_group       = ["15e4c34c-3d93-44b1-83c9-80bc3b17e7a8"]
  rbac_enabled      = false
  client_app_id     = null
  server_app_id     = null
  server_app_secret = null
}
vnet_rg         = "rg-sea-kanomnutt"
aks_vnet_name   = "vnet-sea-kanomnutt"
aks_subnet_name = "snet-aks-001"
storage_profile = {
  blob_driver_enabled         = true
  disk_driver_enabled         = true
  disk_driver_version         = "v1"
  file_driver_enabled         = true
  snapshot_controller_enabled = true
}
agent_pool = {
  name                         = "agtpool"
  vm_size                      = "Standard_D4as_v5"
  os_sku                       = "Ubuntu"
  os_disk_size_gb              = 128
  enabled_pip                  = false
  enabled_auto_scale           = false
  node_count                   = 1
  max_pods                     = 60
  availability_zones           = ["2"]
  only_critical_addons_enabled = false
}

enable_ingress_application_gateway = false
# ingress_application_gateway = {
#   name      = "agw-sea-agic"
#   subnet_id = "/subscriptions/3f7d8648-d191-4240-977f-30a981a94770/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/vnet-sea-kanomnutt/subnets/snet-agic"
# }

tags = {
  "CreateDate" = "04-Apr-2024"
  "System"     = "UpgradeRancher"
}


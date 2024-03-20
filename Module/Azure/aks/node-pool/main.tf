# resource "azurerm_kubernetes_cluster_node_pool" "worker_pools" {
#   count                 = length(var.worker_pool)
#   name                  = var.worker_pool[count.index].worker_name
#   kubernetes_cluster_id = var.aks_id
#   vm_size               = var.worker_pool[count.index].worker_vm_size
#   node_count            = var.worker_pool[count.index].worker_node_count
#   enable_node_public_ip = var.worker_pool[count.index].worker_pip
#   max_pods              = var.worker_pool[count.index].worker_max_pods
#   orchestrator_version  = var.worker_pool[count.index].worker_aks_version
#   vnet_subnet_id        = var.worker_pool[count.index].worker_subnet
#   mode                  = "User"
#   zones                 = var.worker_pool[count.index].worker_availability_zones
#   priority              = "Regular"
#   os_type               = "Linux"
#   os_sku                = var.worker_pool[count.index].worker_os_sku
#   os_disk_size_gb       = var.worker_pool[count.index].worker_os_disk_size_gb
#   node_labels           = var.worker_pool[count.index].worker_labels
#   enable_auto_scaling   = var.worker_pool[count.index].worker_enable_auto_scaling
#   max_count             = var.worker_pool[count.index].worker_enable_auto_scaling == true ? var.worker_pool[count.index].worker_max_count : null
#   min_count             = var.worker_pool[count.index].worker_enable_auto_scaling == true ? var.worker_pool[count.index].worker_min_count : null
#   tags                  = var.tags

#   lifecycle {
#     create_before_destroy = true
#   }
# }
resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pools" {
  name                  = var.node_pool.name
  kubernetes_cluster_id = "${data.azurerm_subscription.current.id}/resourceGroups/${var.aks_rg}/providers/Microsoft.ContainerService/managedClusters/${var.aks_name}"
  vm_size               = var.node_pool.vm_size
  enable_auto_scaling   = var.node_pool.enabled_auto_scale
  node_count            = var.node_pool.node_count
  vnet_subnet_id        = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vnet_rg}/providers/Microsoft.Network/virtualNetworks/${var.aks_vnet_name}/subnets/${var.aks_subnet_name}"
  max_count             = var.node_pool.node_max_count
  min_count             = var.node_pool.node_min_count
  enable_node_public_ip = var.node_pool.enabled_public_ip
  max_pods              = var.node_pool.max_pods
  mode                  = var.node_pool.mode
  zones                 = var.node_pool.availability_zones
  priority              = "Regular"
  node_labels           = var.node_pool.node_labels
  node_taints           = var.node_pool.node_taints
  os_disk_size_gb       = var.node_pool.node_disk_size
  os_type               = "Linux"
  os_sku                = var.node_pool.node_os_sku
  tags                  = var.tags
}

data "azurerm_subscription" "current" {}

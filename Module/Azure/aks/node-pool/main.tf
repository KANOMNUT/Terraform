resource "azurerm_kubernetes_cluster_node_pool" "worker_pools" {
  count                 = length(var.worker_pool)
  name                  = var.worker_pool[count.index].worker_name
  kubernetes_cluster_id = var.aks_id
  vm_size               = var.worker_pool[count.index].worker_vm_size
  node_count            = var.worker_pool[count.index].worker_node_count
  enable_node_public_ip = var.worker_pool[count.index].worker_pip
  max_pods              = var.worker_pool[count.index].worker_max_pods
  orchestrator_version  = var.worker_pool[count.index].worker_aks_version
  vnet_subnet_id        = var.worker_pool[count.index].worker_subnet
  mode                  = "User"
  zones                 = var.worker_pool[count.index].worker_availability_zones
  priority              = "Regular"
  os_type               = "Linux"
  os_sku                = var.worker_pool[count.index].worker_os_sku
  os_disk_size_gb       = var.worker_pool[count.index].worker_os_disk_size_gb
  node_labels           = var.worker_pool[count.index].worker_labels
  enable_auto_scaling   = var.worker_pool[count.index].worker_enable_auto_scaling
  max_count             = var.worker_pool[count.index].worker_enable_auto_scaling == true ? var.worker_pool[count.index].worker_max_count : null
  min_count             = var.worker_pool[count.index].worker_enable_auto_scaling == true ? var.worker_pool[count.index].worker_min_count : null
  tags                  = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

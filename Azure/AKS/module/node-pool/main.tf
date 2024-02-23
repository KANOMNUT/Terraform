resource "azurerm_kubernetes_cluster_node_pool" "worker_pools" {
  count = length(var.worker_pool)
  name = var.worker_pool[count.index].worker_name
  kubernetes_cluster_id = var.aks_id
  vm_size = var.worker_pool[count.index].worker_vm_size
  node_count = var.worker_pool[count.index].worker_node_count
  enable_node_public_ip = var.worker_pool[count.index].worker_pip
  max_pods = var.worker_pool[count.index].worker_max_pods
  orchestrator_version = var.worker_pool[count.index].worker_aks_version
  vnet_subnet_id = var.worker_pool[count.index].worker_subnet
  mode = "User"
  tags = var.worker_pool[count.index].worker_tags
  availability_zones = var.worker_pool[count.index].worker_availability_zones
  priority = "Regular"
  os_type = "Linux"
  node_labels = var.worker_pool[count.index].worker_labels
  enable_auto_scaling = false
  lifecycle {
    create_before_destroy = true
  }
}
variable "worker_pool" {
  type = list(object({
    worker_name                = string
    worker_vm_size             = string
    worker_node_count          = string
    worker_pip                 = bool
    worker_max_pods            = string
    worker_aks_version         = string
    worker_subnet              = string
    worker_availability_zones  = list(string)
    worker_labels              = map(string)
    worker_enable_auto_scaling = bool
    worker_os_sku              = string
    worker_os_disk_size_gb     = number
    worker_max_count           = number
    worker_min_count           = number
  }))
}

variable "aks_id" {
  type = string
}
variable "tags" {
  type = map(string)
}
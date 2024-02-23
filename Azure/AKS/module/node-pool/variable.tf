variable "worker_pool" {
  type = list(object({
    worker_name = string
    worker_vm_size = string
    worker_node_count = string
    worker_pip = bool
    worker_max_pods = string
    worker_aks_version = string
    worker_subnet = string
    worker_tags = map(string)
    worker_availability_zones = list(string)
    worker_labels = map(string)
  }))
}

variable "aks_id" {
  type = string
}
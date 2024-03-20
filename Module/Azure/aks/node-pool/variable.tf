# variable "worker_pool" {
#   type = list(object({
#     worker_name                = string
#     worker_vm_size             = string
#     worker_node_count          = string
#     worker_pip                 = bool
#     worker_max_pods            = string
#     worker_aks_version         = string
#     worker_subnet              = string
#     worker_availability_zones  = list(string)
#     worker_labels              = map(string)
#     worker_enable_auto_scaling = bool
#     worker_os_sku              = string
#     worker_os_disk_size_gb     = number
#     worker_max_count           = number
#     worker_min_count           = number
#   }))
# }

# variable "aks_id" {
#   type = string
# }
# variable "tags" {
#   type = map(string)
# }

variable "node_pool" {
  type = object({
    name               = string
    vm_size            = string
    enabled_auto_scale = bool
    node_count         = number
    node_max_count     = optional(number)
    node_min_count     = optional(number)
    enabled_public_ip  = bool
    max_pods           = number
    mode               = string
    availability_zones = set(string)
    node_labels        = optional(map(string))
    node_taints        = optional(list(string))
    node_disk_size     = number
    node_os_sku        = string
  })
}

variable "aks_rg" {
  type = string
}
variable "vnet_rg" {
  type = string
}
variable "aks_name" {
  type = string
}
variable "aks_vnet_name" {
  type = string
}
variable "aks_subnet_name" {
  type = string
}
variable "tags" {
  type = map(string)
}

variable "aks_name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "kubernetes_version" {
  type = string
}
variable "sku_tier" {
  type = string
}
variable "image_cleaner_interval_hours" {
  type = number
}
variable "azure_ad" {
  type = object({
    rbac_managed      = bool
    tenant_id         = string
    admin_group       = list(string)
    rbac_enabled      = bool
    client_app_id     = string
    server_app_id     = string
    server_app_secret = string
  })
}
variable "storage_profile" {
  type = object({
    blob_driver_enabled         = optional(bool)
    disk_driver_enabled         = optional(bool)
    disk_driver_version         = optional(string)
    file_driver_enabled         = optional(bool)
    snapshot_controller_enabled = optional(bool)
  })
}
variable "agent_pool" {
  type = object({
    name                         = string
    vm_size                      = string
    os_sku                       = string
    os_disk_size_gb              = number
    enabled_pip                  = bool
    enabled_auto_scale           = optional(bool)
    node_count                   = number
    node_max_count               = optional(number)
    node_min_count               = optional(number)
    max_pods                     = number
    availability_zones           = set(string)
    only_critical_addons_enabled = optional(bool)
    node_labels                  = optional(map(string))
  })
}
# variable "agent_pool_name" {
#   type = string
# }
# variable "agent_pool_vm_size" {
#   type = string
# }
# variable "agnet_pool_subnet" {
#   type = string
# }
# variable "agent_pool_os_sku" {
#   type = string
# }
# variable "agent_pool_os_disk_size_gb" {
#   type = string
# }
# variable "agnet_pool_enabled_pip" {
#   type = bool
# }
# variable "agent_pool_node_count" {
#   type = string
# }
# variable "agent_pool_max_pods" {
#   type = string
# }
# variable "agent_pool_availability_zones" {
#   type = set(string)
# }
# variable "agnet_pool_only_critical_addons_enabled" {
#   type = bool
# }
# variable "agent_pool_node_labels" {
#   type = map(string)
# }
variable "tags" {
  type = map(string)
}
variable "vnet_rg" {
  type = string
}
variable "aks_vnet_name" {
  type = string
}
variable "aks_subnet_name" {
  type = string
}
variable "enable_ingress_application_gateway" {
  type = bool
}
variable "ingress_application_gateway" {
  type = object({
    name      = string
    subnet_id = string
  })
  default = {
    name      = null
    subnet_id = null
  }
}

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
variable "aks_subnet_name" {
  type = string
}
variable "aks_vnet_name" {
  type = string
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
variable "tags" {
  type = map(string)
}

variable "node_pool_stl" {
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

variable "vnet_rg" {
  type = string
}
variable "enable_ingress_application_gateway" {
  type    = bool
  default = false
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

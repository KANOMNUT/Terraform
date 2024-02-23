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
  default = {
    admin_group       = null
    client_app_id     = null
    rbac_enabled      = null
    rbac_managed      = null
    server_app_id     = null
    server_app_secret = null
    tenant_id         = null
  }
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
variable "ingress" {
  type = object({
    gateway_name = string
    subnet_id    = string
  })
  default = {
    gateway_name = null
    subnet_id    = null
  }
}
variable "agent_pool_name" {
  type = string
}
variable "agent_pool_vm_size" {
  type = string
}
variable "agnet_pool_subnet" {
  type = string
}
variable "agent_pool_os_sku" {
  type = string
}
variable "agent_pool_os_disk_size_gb" {
  type = string
}
variable "agnet_pool_pip" {
  type = bool
}
variable "agent_pool_node_count" {
  type = string
}
variable "agent_pool_max_pods" {
  type = string
}
variable "agent_pool_availability_zones" {
  type = set(string)
}
variable "agnet_pool_only_critical_addons_enabled" {
  type = bool
}
variable "agent_pool_node_labels" {
  type = map(string)
}
variable "tags" {
  type = map(string)
}

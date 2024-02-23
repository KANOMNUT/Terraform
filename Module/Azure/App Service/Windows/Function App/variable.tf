variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "worker_count" {
  type = string
}
variable "zone_balancing_enabled" {
  type = bool
}
variable "storage_account_name" {
  type = string
}
variable "storage_account_access_key" {
  type = string
}
variable "site_config" {
  type = object({
    app_logs_disk_quota = string
    app_logs_retention = string
    dotnet_version = string
    java_version = string
    node_version = string
    powershell_core_version = string 
  })
  default = {
    app_logs_disk_quota = null
    app_logs_retention = null
    dotnet_version = null
    java_version = null
    node_version = null
    powershell_core_version = null
  }
}
variable "backup_enabled" {
  type = bool
}
variable "backup" {
  type = object({
    storage_account_sas = string
    interval = string
    frequency_unit = string
    retention = string
    start_time = string
  })
  default = {
    storage_account_sas = null
    interval = null
    frequency_unit = null
    retention = null
    start_time = null
  }
}
variable "virtual_network_subnet_id" {
  type = string
}
variable "tags" {
  type = map(string)
}
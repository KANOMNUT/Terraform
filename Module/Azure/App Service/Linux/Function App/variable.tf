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
variable "stack_choice" {
  type = string
}
variable "app_service_logs_enabled" {
  type = bool
}
variable "docker_registry_url" {
  type = string
  default = null
}
variable "docker_image_name" {
  type = string
  default = null
}
variable "docker_image_tag" {
  type = string
  default = null
}
variable "docker_registry_username" {
  type = string
  default = null
}
variable "docker_registry_password" {
  type = string
  default = null
}
variable "dotnet_version" {
  type = string
  default = null
}
variable "java_version" {
  type = string
  default = null
}
variable "node_version" {
  type = string
  default = null
}
variable "python_version" {
  type = string
  default = null
}
variable "powershell_core_version" {
  type = string
  default = null
}
variable "app_logs_disk_quota" {
  type = string
  default = null
}
variable "app_logs_retention" {
  type = string
  default = null
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
  default = null
}
variable "tags" {
  type = map(string)
}
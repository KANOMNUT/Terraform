variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
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
variable "python_version" {
  type = string
  default = null
}
variable "docker_image_name" {
  type = string
  default = null
}
variable "docker_registry_url" {
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
variable "powershell_core_version" {
  type = string
  default = null
}
variable "app_service_logs_enabled" {
  type = bool
}
variable "backup_enabled" {
  type = bool
}
variable "tags" {
  type = map(string)
}
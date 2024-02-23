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
variable "stack_choice" {
  type = string
}
variable "docker" {
  type = object({
    image_name = string
    registry_url = string
    registry_username = string
    registry_password = string 
  })
  default = {
    image_name = null
    registry_url = null
    registry_username = null
    registry_password = null
  }
}
variable "dotnet_version" {
  type = string
  default = null
}
variable "dotnet_core_version" {
  type = string
  default = null
}
variable "node_version" {
  type = string
  default = null
}
variable "php_version" {
  type = string
  default = null
}
variable "python" {
  type = string
  default = null
}
variable "java_embedded_server_enabled" {
  type = bool
  default = null
}
variable "java_version" {
  type = string
  default = null
}
variable "backup_enabled" {
  type = bool
}
variable "storage_account_sas" {
  type = string
  default = null
}
variable "interval" {
  type = string
  default = null
}
variable "frequency_unit" {
  type = string
  default = null
}
variable "retention" {
  type = string
  default = null
}
variable "start_time" {
  type = string
  default = null
}
variable "logs_enabled" {
  type = bool
}
variable "logs" {
  type = object({
    detailed_error_messages = bool
    failed_request_tracing = bool
    http_logs_blob_sas_url = string
    http_logs_retention = string
    http_logs_file_system_retention_in_days = string
    http_logs_file_system_retention_in_mb = string
    file_system_level = string
    application_logs_blob_level = string
    application_logs_blob_retention = string
    application_logs_blob_sas_url = string
  })
  default = {
    detailed_error_messages = null
    failed_request_tracing = null
    http_logs_blob_sas_url = null
    http_logs_retention = null
    http_logs_file_system_retention_in_days = null
    http_logs_file_system_retention_in_mb = null
    file_system_level = null
    application_logs_blob_level = null
    application_logs_blob_retention = null
    application_logs_blob_sas_url = null
  }
}
variable "virtual_network_subnet_id" {
  type = string
  default = "null"
}
variable "tags" {
  type = map(string)
}
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
variable "go_version" {
  type = string
  default = null
}
variable "java" {
  type = object({
    server = string
    server_version = string
    version = string
  })
  default = {
    server = null
    server_version = null
    version = null
  }
}
variable "node_version" {
  type = string
  default = null
}
variable "php_version" {
  type = string
  default = null
}
variable "python_version" {
  type = string
  default = null
}
variable "ruby_version" {
  type = string
  default = null
}
variable "zone_balancing_enabled" {
  type = bool
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
# variable "logs_detailed_error_messages" {
#   type = bool
#   default = null
# }
# variable "logs_failed_request_tracing" {
#   type = bool
#   default = null
# }
# variable "logs_http_logs_blob_sas_url" {
#   type = string
#   default = null
# }
# variable "logs_http_logs_retention" {
#   type = string
#   default = null
# }
# variable "logs_http_logs_file_system_retention_in_days" {
#   type = string
#   default = null
# }
# variable "logs_http_logs_file_system_retention_in_mb" {
#   type = string
#   default = null
# }
# variable "logs_file_system_level" {
#   type = string
#   default = null
# }
# variable "logs_application_logs_blob_level" {
#   type = string
#   default = null
# }
# variable "logs_application_logs_blob_retention" {
#   type = string
#   default = null
# }
# variable "logs_application_logs_blob_sas_url" {
#   type = string
#   default = null
# }
variable "logs" {
  type = object({
    detailed_error_messages = bool
    failed_request_tracing = bool
    http_logs_blob_sas_url = string
    http_logs_retention = string
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
    file_system_level = null
    application_logs_blob_level = null
    application_logs_blob_retention = null
    application_logs_blob_sas_url = null
  }
}
variable "logs_enabled" {
  type = bool
}
variable "virtual_network_subnet_id" {
  type = string
  default = null
}
variable "tags" {
  type = map(string)
}
name = "webapp-sea-kanomnutt"
resource_group_name = "rg-sea-kanomnutt"
location = "southeastasia"
worker_count = "1"
sku_name = "B1"
zone_balancing_enabled = false
stack_choice = "node"
node_version = "18-lts"
backup_enabled = true
storage_account_sas = ""
interval = "1"
frequency_unit = "Day"
retention = "7"
start_time = "2023-12-22T22:00:00Z"
logs_enabled = true
logs = {
  detailed_error_messages = true
  failed_request_tracing = true
  http_logs_blob_sas_url = ""
  http_logs_retention = "7"
  file_system_level = "Verbose"
  application_logs_blob_level = "Verbose"
  application_logs_blob_retention = "7"
  application_logs_blob_sas_url = ""
}
tags = {
  "CreateDate" = "22-Dec-2023"
}
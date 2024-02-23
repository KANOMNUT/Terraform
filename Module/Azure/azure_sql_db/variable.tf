variable "sql_db_name" {
  type = string
}
variable "sql_server_id" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "elastic_pool_id" {
  type    = string
  default = null
}
variable "geo_backup_enabled" {
  type = string
}
variable "used_elastic_pool" {
  type    = bool
  default = false
}
variable "min_capacity" {
  type = number
}
variable "max_size_gb" {
  type = number
}
variable "storage_account_type" {
  type    = string
  default = "Local"
}
variable "zone_redundant" {
  type = bool
}
variable "threat_detection_enabled" {
  type    = bool
  default = false
}
variable "detection_disabled_alerts" {
  type = set(string)
}
variable "detection_email_admin" {
  type = string
}
variable "detection_email_alert" {
  type = set(string)
}
variable "detection_retention_days" {
  type = number
}
variable "detection_storage_access_key" {
  type = string
}
variable "detection_storage_endpoint" {
  type = string
}
variable "short_term_enabled" {
  type = bool
}
variable "short_term_retention_days" {
  type = number
}
variable "short_term_interval" {
  type = number
}
variable "long_term_enabled" {
  type = bool
}
variable "long_term_weekly_retention" {
  type = string
}
variable "long_term_monthly_retention" {
  type = string
}
variable "long_term_yearly_retention" {
  type = string
}
variable "long_term_backup_week" {
  type = number
}
variable "tags" {
  type = map(string)
}

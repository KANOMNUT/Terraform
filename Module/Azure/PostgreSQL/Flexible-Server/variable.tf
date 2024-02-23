variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "pg_version" {
  type = string
}
variable "delegated_subnet_id" {
  type = string
}
variable "private_dns_zone_id" {
  type = string
}
variable "zone" {
  type = string
}
variable "enable_high_availability" {
  type = bool
}
variable "ha_mode" {
  type = string
}
variable "standby_zone" {
  type = string
}
variable "storage_mb" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "geo_redundant_backup_enabled" {
  type = bool
}
variable "backup_retention_days" {
  type = string
}
variable "administrator_login" {
  type = string
}
variable "administrator_password" {
  type = string
}
variable "azuread_auth" {
  type = bool
}
variable "azuread_pass_auth" {
  type = bool
}
variable "azuread_tenant_id" {
  type = string
}
variable "tags" {
  type = map(string)
}

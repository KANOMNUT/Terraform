variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
  default = "Southeast Asia"
}
variable "administrator_login_password" {
  type = string
}
variable "coordinator_storage_quota_in_mb" {
  type = string
}
variable "coordinator_vcore_count" {
  type = string
}
variable "coordinator_public_ip_access_enabled" {
  type = bool
}
variable "node_count" {
  type = number
}
variable "ha_enabled" {
  type = string
}
variable "preferred_primary_zone" {
  type = string
}
variable "sql_version" {
  type = string
}
variable "firewall_rules" {
  type = list(object({
    firewall_rules_name     = string
    firewall_rules_start_ip = string
    firewall_rules_end_ip   = string
  }))
}
variable "users" {
  type = list(object({
    pg_username = string
    pg_password = string
  }))
}

variable "tags" {
  type = map(string)
}

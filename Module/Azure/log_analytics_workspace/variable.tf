variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "sku" {
  type = string
}
variable "retention_in_days" {
  type = string
}
variable "daily_quota_gb" {
  type = string
}
variable "tags" {
  type = map(string)
}

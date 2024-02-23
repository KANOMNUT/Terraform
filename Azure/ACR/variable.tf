variable "acr_name" {
  type = string
}
variable "rg" {
  type = string
}
variable "location" {
  type = string
}
variable "sku" {
  type = string
}
variable "admin_enabled" {
  type = bool
}
variable "tags" {
  type = map(string)
}
variable "acr_scope_map" {
  type = list(object({
    name = string
    actions = list(string)
  }))
}
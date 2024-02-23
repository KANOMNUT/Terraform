variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "zones" {
  type = set(string)
}
variable "frontend_public_ip_address_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "frontend_private_ip" {
  type = string
}
variable "backend_address_pool" {
  type = list(object({
    name         = string
    fqdns        = optional(list(string))
    ip_addresses = optional(list(string))
  }))
}
variable "backend_http_settings" {
  type = list(object({
    name                                = string
    cookie_based_affinity               = string
    path                                = string
    protocol                            = string
    port                                = number
    probe_name                          = optional(string)
    request_timeout                     = number
    pick_host_name_from_backend_address = bool
    host_name                           = string
  }))
}
variable "request_routing_rule" {
  type = list(object({
    name                  = string
    type                  = string
    http_listener_name    = string
    backend_pool_name     = string
    backend_settings_name = string
    priority              = number
  }))
}
variable "http_listener" {
  type = list(object({
    name                           = string
    frontend_ip_configuration_name = string
    frontend_port_name             = string
    host_name                      = optional(string)
    host_names                     = optional(list(string))
    protocol                       = string
    ssl_certificate_name           = string
  }))
}
variable "ssl_certificate" {
  type = list(object({
    name                = string
    key_vault_secret_id = string
  }))
}
variable "sku" {
  type = object({
    name     = string
    tier     = string
    capacity = optional(number)
  })
}
variable "autoscale_configuration" {
  type = object({
    min = number
    map = optional(number)
  })
}
variable "tags" {
  type = map(string)
}

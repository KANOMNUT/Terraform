resource "azurerm_application_gateway" "azure_application_gateway" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  zones               = var.zones
  frontend_ip_configuration {
    name                          = "${var.name}-fe-ip"
    public_ip_address_id          = var.frontend_public_ip_address_id
    subnet_id                     = var.subnet_id
    private_ip_address            = var.frontend_private_ip
    private_ip_address_allocation = "Static"
  }
  gateway_ip_configuration {
    name      = "${var.name}-gateway-ip"
    subnet_id = var.subnet_id
  }
  frontend_port {
    name = "${var.name}-frontend-port"
    port = 80
  }
  dynamic "backend_address_pool" {
    for_each = var.backend_address_pool
    content {
      name         = backend_address_pool.value.name
      fqdns        = backend_address_pool.value.fqdns
      ip_addresses = backend_address_pool.value.ip
    }

  }
  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings
    content {
      name                                = backend_http_settings.value.name
      cookie_based_affinity               = backend_http_settings.value.cookie_based_affinity
      path                                = backend_http_settings.value.path
      protocol                            = backend_http_settings.value.protocol
      port                                = backend_http_settings.value.port
      probe_name                          = backend_http_settings.value.probe_name
      request_timeout                     = backend_http_settings.value.request_timeout
      pick_host_name_from_backend_address = backend_http_settings.value.pick_host_name_from_backend_address
      host_name                           = backend_http_settings.value.host_name
    }

  }
  dynamic "request_routing_rule" {
    for_each = var.request_routing_rule
    content {
      name                       = request_routing_rule.value.name
      rule_type                  = request_routing_rule.value.type
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_settings_name
      priority                   = request_routing_rule.value.priority
    }
  }
  dynamic "http_listener" {
    for_each = var.http_listener
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      host_name                      = http_listener.value.host_name
      host_names                     = http_listener.value.host_names
      protocol                       = http_listener.value.protocol
      ssl_certificate_name           = http_listener.value.ssl_certificate_name
    }
  }
  dynamic "ssl_certificate" {
    for_each = var.ssl_certificate
    content {
      name                = ssl_certificate.value.name
      key_vault_secret_id = ssl_certificate.value.key_vault_secret_id
    }
  }
  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    capacity = var.sku.capacity
  }
  autoscale_configuration {
    min_capacity = var.autoscale.min
    max_capacity = var.autoscale.max
  }
  tags = var.tags
}

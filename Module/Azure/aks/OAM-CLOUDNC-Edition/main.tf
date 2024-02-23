data "azurerm_kubernetes_service_versions" "kubernetes_version" {
  location = var.location
  version_prefix = var.kubernetes_version_prefix
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  node_resource_group = var.node_resource_group_name
  dns_prefix          = var.name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.kubernetes_version.latest_version
  
  addon_profile {
    azure_policy {
      enabled = false
    }
    http_application_routing {
      enabled = false
    }
    kube_dashboard {
      enabled = false
    }
    oms_agent {
      enabled = false
    }
  }

  default_node_pool {
    name                  = var.agent_pool_name
    vnet_subnet_id        = var.subnet_id
    vm_size               = var.node_vm_size
    type                  = "VirtualMachineScaleSets"
    enable_node_public_ip = var.node_enable_public_ip
    node_count            = var.agent_node_count
    node_labels           = var.node_labels
    max_pods              = var.node_max_pods
    availability_zones    = var.node_availability_zones
    orchestrator_version  = data.azurerm_kubernetes_service_versions.kubernetes_version.latest_version
    only_critical_addons_enabled  = var.only_critical_addons_enabled
    tags                  = var.aks_tags
  }

  identity {
    type = "UserAssigned"
    user_assigned_identity_id = var.user_assigned_identity_id
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
    network_policy     = "azure"
  }

  role_based_access_control {
    azure_active_directory {
      managed           = false
      client_app_id     = azuread_application.azuread_client.application_id
      server_app_id     = azuread_application.azuread_server.application_id
      server_app_secret = random_string.password_random.result
      tenant_id         = var.tenant_id
    }    
    enabled = true
  }

  tags = var.aks_tags

  depends_on = [
    azuread_service_principal_password.azuread_server_principal_password,
    azuread_application.azuread_client
  ]

}
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name = var.aks_name
  location = var.location
  resource_group_name = var.rg
  dns_prefix = var.aks_name
  kubernetes_version = var.aks_version
  automatic_channel_upgrade = "stable"
  sku_tier = "Free"

  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed = true
      azure_rbac_enabled = true
    }
  }
  # service_principal {
  #   client_id = var.sp_id
  #   client_secret = var.sp_secret
  # }
  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    ingress_application_gateway {
      enabled = true
      gateway_name = var.aks_agic_name
      subnet_id = var.aks_agic_subnet
    }
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

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
    network_policy     = "azure"
  }

  default_node_pool {
    name = var.agent_pool_name
    vm_size = var.agent_pool_vm_size
    vnet_subnet_id = var.agnet_pool_subnet
    type = "VirtualMachineScaleSets"
    enable_node_public_ip = var.agnet_pool_pip
    node_count = var.agent_pool_node_count
    max_pods = var.agent_pool_max_pods
    availability_zones = var.agent_pool_availability_zones
    only_critical_addons_enabled = var.agnet_pool_only_critical_addons_enabled
    node_labels = var.agent_pool_node_labels
    tags = var.aks_tags
  }

  tags = var.aks_tags
}

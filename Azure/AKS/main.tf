provider "azurerm" {
  features {}
  # skip_provider_registration = true
  # subscription_id = "$SUBSCRIPTION_ID"
  # client_id = "$CLIENT_ID"
  # client_secret = "$CLIENT_SECRET"
  # tenant_id = "$TENANT_ID"
}

terraform {
  backend "azurerm" {
    # subscription_id = "$SUBSCRIPTION_ID"
    # client_id = "$CLIENT_ID"
    # client_secret = "$CLIENT_SECRET"
    # tenant_id = "$TENANT_ID"
    resource_group_name = "rg-sea-kanomnutt"
    storage_account_name = "terraformstatekanomnutt"
    container_name = "tfstate"
    key = "az-aks.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
   azuread = {
      source = "hashicorp/azuread"
      version = "1.4.0"
    }
  }
}


module "aks_cluster" {
#  source = "./module/cluster"
  source = "git@gitlab.com:thanachai.tre/terraform-module//aks/cluster/"
  aks_name = var.aks_name
  location = var.location
  rg = var.rg
  aks_version = var.aks_version
  # sp_id = var.sp_id
  # sp_secret = var.sp_secret
  aks_agic_name = var.aks_agic_name
  aks_agic_subnet = var.aks_agic_subnet

  agent_pool_name = var.agent_pool_name
  agent_pool_vm_size = var.agent_pool_vm_size
  agnet_pool_subnet = var.agnet_pool_subnet
  agnet_pool_pip = var.agnet_pool_pip
  agent_pool_node_count = var.agent_pool_node_count
  agent_pool_max_pods = var.agent_pool_max_pods
  agent_pool_availability_zones = var.agent_pool_availability_zones
  agnet_pool_only_critical_addons_enabled = var.agnet_pool_only_critical_addons_enabled
  agent_pool_node_labels = var.agent_pool_node_labels
  aks_tags = var.aks_tags

}

module "aks_worker" {
#  source = "./module/node-pool"
  source = "git@gitlab.com:thanachai.tre/terraform-module//aks/node-pool/"
  aks_id = module.aks_cluster.kubernetes_cluster_id
  worker_pool = var.aks_worker_pool
  depends_on = [ module.aks_cluster ]
}

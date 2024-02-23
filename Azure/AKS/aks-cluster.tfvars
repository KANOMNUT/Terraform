aks_name = "aks-kanomnutt"
location = "Southeast Asia"
rg = "rg-sea-kanomnutt"
aks_version = "1.25.5"
# sp_id = "bd804247-530c-4705-b1c7-7be496cdb1bc"
# sp_secret = "yC78Q~Db8FuSgcJyWQ3avZ3LF.5PHeeX4VNBwaLu"
aks_agic_name = "aks-agic"
aks_agic_subnet = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/kanomnutt-vnet/subnets/kanomnutt-agic"

agent_pool_name = "aksagtpool"
agent_pool_vm_size = "Standard_B2s"
agnet_pool_subnet = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/kanomnutt-vnet/subnets/kanomnutt-subnet1"
agnet_pool_pip = false
agent_pool_node_count = "1"
agent_pool_max_pods = "110"
agent_pool_availability_zones = ["1"]
agnet_pool_only_critical_addons_enabled = true
agent_pool_node_labels = {
  "type" = "agent"
}
aks_tags = {
  "CreateDate" = "24-Apr-2023"
  "System" = "AKS"
  "Type" = "Agent-Pool"
}


aks_worker_pool = [ {
    worker_name = "aksstfpool"
    worker_vm_size = "Standard_B2s"
    worker_node_count = "1"
    worker_pip = false
    worker_max_pods = "110"
    worker_aks_version = "1.25.5"
    worker_subnet = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/kanomnutt-vnet/subnets/kanomnutt-subnet1"
    worker_tags = {
      "CreateDate" = "24-Apr-2023"
      "System" = "AKS"
      "Type" = "Stateful-Pool"
    }
    worker_availability_zones = ["1"]
    worker_labels = {
      "type" = "stateful"
    }
  },
  {
    worker_name = "aksstlpool"
    worker_vm_size = "Standard_B2s"
    worker_node_count = "1"
    worker_pip = false
    worker_max_pods = "110"
    worker_aks_version = "1.25.5"
    worker_subnet = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/kanomnutt-vnet/subnets/kanomnutt-subnet1"
    worker_tags = {
      "CreateDate" = "24-Apr-2023"
      "System" = "AKS"
      "Type" = "Stateless-Pool"
    }
    worker_availability_zones = ["1"]
    worker_labels = {
      "type" = "stateless"
    }
  } 
]
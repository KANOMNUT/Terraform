location            = "Japan West"
resource_group_name = "rg-sea-kanomnutt"
tags                = {
  "CostCenter" = "91610"
  "Environment" = "POC"
  "System" = "REDASH"
  "CreateDate" = "19-Apr-2023"
}
vnet_name = "kanomnutt-vnet"
subnet_name = "kanomnutt-subnet1"
address_space = [ "192.168.0.0/16" ]
address_prefixes = [ "192.168.0.0/21" ]
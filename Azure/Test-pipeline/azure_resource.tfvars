rg_name = "rg-sea-kanomnutt-test-pipeline"
location = "southeastasia"
vnet_name = "vnet-sea-kanomnutt-test-pipeline"
address_space = [ "192.168.0.0/16" ]
subnet = [ {
  address_prefix = "192.168.1.0/24"
  name = "snet-sea-kanomnutt01"
},
{
    address_prefix = "192.168.10.0/24"
    name = "snet-sea-kanomnutt02"
},
{
    address_prefix = "192.168.2.0/24"
    name = "snet-sea-kanomnutt03"
},]
tags = {
  "System" = "Terraform_Pipeline"
  "CreateDate" = "16-Feb-2024"
  "Owner" = "Kanomnutt"
}
# DESTROY
vm_name = "terraform-vm"
location = "southeastasia"
resource_group_name = "rg-sea-kanomnutt"
publisher = "Canonical"
offer = "0001-com-ubuntu-server-jammy"
sku = "22_04-lts-gen2"
version_os = "latest"
tags = {
  "CreateDate" = "19-Apr-2023"
}
vm_size = "Standard_DS1_v2"
os_disk_type = "StandardSSD_LRS"
os_disk_size = "32"
data_disk_type = "StandardSSD_LRS"
data_disk_size = "64"
subnet_id = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/kanomnutt-vnet/subnets/kanomnutt-subnet1"
nsg_id = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/networkSecurityGroups/kanomnutt-nsg"
sql_name = "kanomnutt-sql"
rg = "rg-sea-kanomnutt"
location = "southeastasia"
admin_user = "kanomnutt"
tags = {
  "CreateDate" = "8-May-2023"
}
ad_admin = "thanachai.tre@gmail.com"
admin_object_id = "0893967e-b89b-4c6d-a29c-59f2c2572f03"
sql-subnet_id = "/subscriptions/3767ecfe-807d-4701-b2af-3538689bc187/resourceGroups/rg-sea-kanomnutt/providers/Microsoft.Network/virtualNetworks/kanomnutt-vnet/subnets/kanomnutt-subnet1"
sql_fw_rule = [ {
    name = "rule1"
    start_ip = "192.168.1.100"
    end_ip = "192.168.1.105"
  },
  {
    name = "rule2"
    start_ip = "192.168.1.200"
    end_ip = "192.168.1.250"
  } 
]
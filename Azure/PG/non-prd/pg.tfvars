rg = "rg-sea-kanomnutt"
pg_name = "kanomnutt-pg-non-prd"
pg_admin_user = "psqladmin"
sku = "B_Gen5_2"
version_pg = "11"
storage_mb = "51200"
tag = {
  "CreateDate" = "21-Apr-2023"
}
firewall_rules = [ 
    {
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

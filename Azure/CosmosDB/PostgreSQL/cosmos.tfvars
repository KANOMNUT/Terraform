name                                 = "cosmos-sea-kanomnutt"
resource_group_name                  = "rg-sea-kanomnutt"
location                             = "southeastasia"
administrator_login_password         = "P@ssw0rd"
coordinator_storage_quota_in_mb      = "131072"
coordinator_vcore_count              = "2"
coordinator_public_ip_access_enabled = true
node_count                           = 0
ha_enabled                           = "false"
preferred_primary_zone               = "1"
sql_version                          = "16"
firewall_rules = [
  {
    firewall_rules_name     = "FW_Rule01"
    firewall_rules_start_ip = "0.0.0.0"
    firewall_rules_end_ip   = "1.1.1.1"
  },
  {
    firewall_rules_name     = "FW_Rule02"
    firewall_rules_start_ip = "2.2.2.2"
    firewall_rules_end_ip   = "3.3.3.3"
  },
]
users = [
  {
    pg_username = "app01"
    pg_password = "P@ssw0rd"
  },
  {
    pg_username = "app02"
    pg_password = "P@ssw0rd"
  },
]
tags = {
  "CreateDate" = "06-Feb-2024"
}

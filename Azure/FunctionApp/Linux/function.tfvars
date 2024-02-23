name = "func-sea-terraform"
resource_group_name = "rg-sea-kanomnutt"
location = "southeastasia"
sku_name = "B1"
worker_count = "1"
zone_balancing_enabled = false
storage_account_name = "ptpstoragepoc"
storage_account_access_key = "07H6YarwS0BF5sdwbKYw14HLFgegS2eK9iQFa229b9WqoSmhP+JUKfIDMig/VffZi8F7fI2biR/P+AStb/4b/w=="
stack_choice = "docker"
docker_image_name = "nginx"
docker_image_tag = "latest"
docker_registry_url = "hub.docker.com"
app_service_logs_enabled = false
backup_enabled = false
tags = {
  "CreateDate" = "2-Jan-2024"
}
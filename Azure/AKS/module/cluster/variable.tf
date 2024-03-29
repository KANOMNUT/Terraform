variable "aks_name" {
    type = string  
}
variable "location" {
  type = string
}
variable "rg" {
  type = string
}
variable "aks_version" {
  type = string
}
# variable "sp_id" {
#   type = string
# }
# variable "sp_secret" {
#   type = string
# }
variable "aks_agic_name" {
  type = string
}
variable "aks_agic_subnet" {
  type = string
}
variable "agent_pool_name" {
  type = string
}
variable "agent_pool_vm_size" {
  type = string
}
variable "agnet_pool_subnet" {
  type = string
}
variable "agnet_pool_pip" {
  type = bool
}
variable "agent_pool_node_count" {
  type = string
}
variable "agent_pool_max_pods" {
  type = string
}
variable "agent_pool_availability_zones" {
  type = list
}
variable "agnet_pool_only_critical_addons_enabled" {
  type = bool
}
variable "agent_pool_node_labels" {
  type = map(string)
}
variable "aks_tags" {
  type = map(string)
}

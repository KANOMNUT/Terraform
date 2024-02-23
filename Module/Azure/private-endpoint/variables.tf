variable "name" {
  description = "name"
}

variable "resource_group_name" {
  description = "Private Endpoint Resource Group Name"
}

variable "location" {
  description = "Location"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "connection_name" {
  description = "Connection Name"
}

variable "private_connection_resource_id" {
  description = "Private Connection Resource ID"
}

variable "connected_resources" {
  description = "Connection Resources"
  type = list
}
variable "private_dns_zone_name" {
  type = string
}
variable "private_dns_zone_ids" {
  type = list(string)
}

variable "tags" {
  description = "Tags"
  type = map(string)
}
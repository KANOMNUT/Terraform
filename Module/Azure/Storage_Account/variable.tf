variable "name" {
  description = "name"
}

variable "resource_group_name" {
  description = "Storage Account Resource Group Name"
}

variable "location" {
  description = "Location"
}

variable "storage_type" {
  description = "Storage Type"
}

variable "storage_tier" {
  description = "Storage Tier"
}

variable "storage_replication_type" {
  description = "Storage Replication Type"
}

variable "storage_access_tier" {
  description = "Storage Access Tier"
}

variable "allowed_subnet_ids" {
  description = "Allowed Subnet IDs"
  type = list(string)
}
variable "ip_rules" {
  type = set(string)
}

variable "cors_allowed_headers" {
  description = "CORS Allowed Headers"
  type = list(string)
  default = ["*"]
}

variable "cors_allowed_methods" {
  description = "CORS Allowed Methods"
  type = list(string)
  default = ["DELETE","GET","HEAD","MERGE","POST","OPTIONS","PUT","PATCH"]
}

variable "cors_allowed_origins" {
  description = "CORS Allowed Origins"
  type = list(string)
  default = ["*"]
}

variable "cors_exposed_headers" {
  description = "CORS Exposed Headers"
  type = list(string)
  default = ["*"]
}

variable "cors_max_age_in_seconds" {
  description = "CORS Max Age in Seconds"
  type = number
  default = 200
}

variable "delete_retention_days" {
  description = "Delete Retention Days"
  type = number
  default = 30
}

variable "container_delete_retention_days" {
  type = string
}

variable "custom_domain_enabled" {
  type = bool
}

variable "custom_domain_name" {
  type = string
  default = null
}
variable "use_subdomain" {
  type = bool
  default = null
}

variable "tags" {
  description = "Tags"
  type = map(string)
}
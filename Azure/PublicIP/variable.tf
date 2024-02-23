# variable "name" {
#   type = string
# }

# variable "resource_group_name" {
#   type = string
# }

# variable "location" {
#   type = string
#   default = "southeastasia"
# }

# variable "allocation_method" {
#   type = string
#   default = "Dynamic"
# }

# variable "sku" {
#   type = string
#   default = "Basic"
# }

# variable "ip_version" {
#   type = string
#   default = "IPv4"
# }

# variable "tag" {
#   type = map(string)
# }

variable "pip" {
    type = list(object({
    name = string
    location = string
    resource_group_name = string
    allocation_method = string
    sku = string
    ip_version = string
    tags = map(string)
  }))
}

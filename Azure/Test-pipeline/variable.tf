variable "rg_name" {
    type = string
}
variable "location" {
    type = string
}
variable "vnet_name" {
    type = string
}
variable "address_space" {
    type = list(string)
}
variable "subnet" {
    type = list(object({
      name = string
      address_prefix = string
      security_group = optional(string)
    }))
}
variable "tags" {
    type = map(string)
}
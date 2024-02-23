variable "tm_name" {
  type = string
}
variable "tm_rg" {
  type = string
}
variable "tm_route_method" {
  type = string
}
variable "tm_traffic_view" {
  type = bool
}
variable "relative_name" {
  type = string
}
variable "ttl" {
  type = string
}
variable "protocol" {
  type = string
}
variable "port" {
  type = string
}
variable "path" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "sa_name" {
  type = string
}
variable "container_name" {
  type = string
}

variable "blob" {
  type = list(object({
    blob_name = string
    blob_type = string
    blob_source = string
  }))
  description = "blob_type has only Append, Block, Page"
}
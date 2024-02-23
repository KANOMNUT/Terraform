variable "release_name" {
    description = "Release Name"
}

variable "chart_repository" {
    description = "Chart Repository"
}

variable "chart_name" {
    description = "Chart Name"
}

variable "chart_version" {
    description = "Chart Version"
}

variable "config_file_path" {
    description = "Config File Path"
}

variable "namespace" {
    description = "Namespace"
}

variable "max_history" {
    description = "Max History"
    type = number
    default = 10
}

variable "lint_enabled" {
    description = "Lint Enabled"
    type = bool
    default = true
}

variable "atomic_enabled" {
    description = "Atomic Enabled"
    type = bool
    default = true
}

variable "depends_resource_id" {
  description = "Depends Resource ID"
  type = any
  default = ""
}
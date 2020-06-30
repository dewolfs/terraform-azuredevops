variable "default_tags" {
  type = map
  description = "A mapping of tags to assign to the resource"
}

variable "infra_rg_name" {
  type = string
}

variable "infra_rg_location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "snet_name_01" {
  type = string
}

variable "address_prefix_01" {
  type = string
}

variable "snet_name_02" {
  type = string
}

variable "address_prefix_02" {
  type = string
}

variable "address_space" {
  type = string
}
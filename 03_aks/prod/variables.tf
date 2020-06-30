variable "aks_rg_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "aks_rg_location" {
  type = string
}

variable "default_tags" {
  type = map
}

variable "default_node_pool_name" {
  type = string
}

variable "default_node_pool_count" {
  type = string
}

variable "default_node_pool_node_vm_size" {
  type = string
}

#variable "default_node_pool_zones" {
#  type = list(string)
#}

variable "aks_dns_prefix" {
  type = string
}

variable "aks_k8s_version" {
  type = string
}
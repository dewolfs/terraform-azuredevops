# AKS
aks_rg_name                     = "_rg-aks-p-we-001"
aks_rg_location                 = "West Europe"

aks_name                        = "aks-p-we-001"
aks_dns_prefix                  = "akspwecl001"
default_node_pool_name          = "pool01"
default_node_pool_count         = 1
#default_node_pool_zones         = ["1", "2", "3"]
default_node_pool_node_vm_size  = "Standard_D2_v3"
aks_k8s_version                 = "1.18.2"

default_tags = {
  Project                       = "001"
  Environment                   = "Production"
  Team                          = "Corporate IT"
}
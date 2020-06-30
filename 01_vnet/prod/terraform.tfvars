# VNET
infra_rg_name                   = "_rg-infra-p-we-001"
infra_rg_location               = "West Europe"

vnet_name                       = "vnet-p-we-001"
address_space                   = "12.0.0.0/16"
snet_name_01                    = "snet-p-we-001-aks-01"
address_prefix_01               = "12.0.1.0/24"
snet_name_02                    = "snet-p-we-001-aks-02"
address_prefix_02               = "12.0.2.0/24"

default_tags = {
  Project                       = "001"
  Environment                   = "Production"
  Team                          = "Corporate IT"
}
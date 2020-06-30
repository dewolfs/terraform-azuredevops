# VNET
infra_rg_name                   = "_rg-infra-d-we-001"
infra_rg_location               = "West Europe"

vnet_name                       = "vnet-d-we-001"
address_space                   = "11.0.0.0/16"
snet_name_01                    = "snet-d-we-001-aks-01"
address_prefix_01               = "11.0.1.0/24"
snet_name_02                    = "snet-d-we-001-aks-02"
address_prefix_02               = "11.0.2.0/24"

default_tags = {
  Project                       = "001"
  Environment                   = "Development"
  Team                          = "Corporate IT"
}
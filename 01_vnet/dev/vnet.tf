# Create infra resource group
resource "azurerm_resource_group" "rg-infra-p-we-001" {
  name                = var.infra_rg_name
  location            = var.infra_rg_location
  tags                = var.default_tags
}

# Create virtual network
resource "azurerm_virtual_network" "vnet-p-we-001" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg-infra-p-we-001.name
  location            = azurerm_resource_group.rg-infra-p-we-001.location
  address_space       = [var.address_space]
  tags                = var.default_tags
}

# Create subnet
resource "azurerm_subnet" "snet-p-we-001-aks-01" {
  name                 = var.snet_name_01
  virtual_network_name = azurerm_virtual_network.vnet-p-we-001.name
  resource_group_name  = azurerm_resource_group.rg-infra-p-we-001.name
  address_prefixes     = [var.address_prefix_01]
}

resource "azurerm_subnet" "snet-p-we-001-aks-02" {
  name                 = var.snet_name_02
  virtual_network_name = azurerm_virtual_network.vnet-p-we-001.name
  resource_group_name  = azurerm_resource_group.rg-infra-p-we-001.name
  address_prefixes     = [var.address_prefix_02]
}
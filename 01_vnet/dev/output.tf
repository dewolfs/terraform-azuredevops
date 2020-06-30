output "vnetResourceGroup" {
    value = azurerm_resource_group.rg-infra-p-we-001.name
}

output "vnetName" {
    value = azurerm_virtual_network.vnet-p-we-001.name
}

output "vnetID" {
    value = azurerm_virtual_network.vnet-p-we-001.id
}

output "vnetAddressSpace" {
    value = azurerm_virtual_network.vnet-p-we-001.address_space
}

output "vnetSubnetName1" {
    value = azurerm_subnet.snet-p-we-001-aks-01.name
}

output "vnetSubnetPrefix1" {
    value = azurerm_subnet.snet-p-we-001-aks-01.address_prefix
}

output "vnetSubnetName2" {
    value = azurerm_subnet.snet-p-we-001-aks-02.name
}

output "vnetSubnetPrefix2" {
    value = azurerm_subnet.snet-p-we-001-aks-02.address_prefix
}
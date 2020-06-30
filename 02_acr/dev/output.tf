output "acrResourceGroup" {
    value = azurerm_resource_group.rg-acr-p-we-001.name
}

output "acrLocation" {
    value = azurerm_resource_group.rg-acr-p-we-001.location
}

output "acrID" {
    value = azurerm_container_registry.acr-p-we-001.id
}

output "login_server" {
    value = azurerm_container_registry.acr-p-we-001.login_server
}
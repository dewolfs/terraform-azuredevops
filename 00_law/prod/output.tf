output "logResourceGroupName" {
    value = azurerm_resource_group.rg-law-p-we-001.name
}

output "logLocation" {
    value = azurerm_resource_group.rg-law-p-we-001.location
}

output "logSku" {
    value = azurerm_log_analytics_workspace.law-p-we-001.sku
}

output "logID" {
    value = azurerm_log_analytics_workspace.law-p-we-001.id
}

output "logWorkspaceID" {
    value = azurerm_log_analytics_workspace.law-p-we-001.workspace_id
}
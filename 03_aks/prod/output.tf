output "aksResourceGroup" {
    value = azurerm_resource_group.rg-aks-p-we-001.name
}

output "aksClusterName" {
    value = azurerm_kubernetes_cluster.aks-p-we-001.name
}

output "aksDNSPrefix" {
    value = azurerm_kubernetes_cluster.aks-p-we-001.dns_prefix
}

output "aksDefaultPoolName" {
    value = azurerm_kubernetes_cluster.aks-p-we-001.default_node_pool[0].name
}

output "aksDefaultPoolNodeCount" {
    value = azurerm_kubernetes_cluster.aks-p-we-001.default_node_pool[0].node_count
}

output "aksDefaultPoolVMSize" {
    value = azurerm_kubernetes_cluster.aks-p-we-001.default_node_pool[0].vm_size
}
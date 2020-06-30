# Retrieve details from existing resource
data "azurerm_log_analytics_workspace" "law-d-we-001" {
  resource_group_name       = "_rg-law-d-we-001"
  name                      = "law-d-we-001"
}

# Retrieve details from existing resource
data "azurerm_container_registry" "acr-d-we-001" {
  resource_group_name       = "_rg-acr-d-we-001"
  name                      = "acrdwe001"
}

# Retrieve details from existing resource
data "azurerm_subnet" "snet-d-we-001-aks-pool01" {
  resource_group_name       = "_rg-infra-d-we-001"
  name                      = "snet-d-we-001-aks-01"
  virtual_network_name      = "vnet-d-we-001"
}

# Create AKS resource group
resource "azurerm_resource_group" "rg-aks-d-we-001" {
  name                      = var.aks_rg_name
  location                  = var.aks_rg_location
  tags                      = var.default_tags
}

# Create AKS
resource "azurerm_kubernetes_cluster" "aks-d-we-001" {
  name                      = var.aks_name
  resource_group_name       = azurerm_resource_group.rg-aks-d-we-001.name
  node_resource_group       = var.aks_name
  location                  = azurerm_resource_group.rg-aks-d-we-001.location
  dns_prefix                = var.aks_dns_prefix
  kubernetes_version        = var.aks_k8s_version

  default_node_pool {
    name                    = var.default_node_pool_name
    node_count              = var.default_node_pool_count
    vm_size                 = var.default_node_pool_node_vm_size
    type                    = "VirtualMachineScaleSets"
    enable_auto_scaling     = false
#   availability_zones      = var.default_node_pool_zones
    vnet_subnet_id          = data.azurerm_subnet.snet-d-we-001-aks-pool01.id
  }

  identity {
    type                    = "SystemAssigned"
  }

  network_profile {
    network_plugin          = "azure"
    load_balancer_sku       = "standard"
  }

  addon_profile {
    oms_agent {
      enabled               = true
      log_analytics_workspace_id = data.azurerm_log_analytics_workspace.law-d-we-001.id
    }
    kube_dashboard {
      enabled               = true
    }
  }

  tags                      = var.default_tags
}

resource "azurerm_role_assignment" "aks_acr" {
  scope                     = data.azurerm_container_registry.acr-d-we-001.id
  role_definition_name      = "AcrPull"
  principal_id              = azurerm_kubernetes_cluster.aks-d-we-001.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}
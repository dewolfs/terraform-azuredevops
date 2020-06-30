# Create ACR resource group
resource "azurerm_resource_group" "rg-acr-p-we-001" {
  name                            = var.acr_rg_name
  location                        = var.acr_rg_location
  tags                            = var.default_tags
}

# Create ACR
resource "azurerm_container_registry" "acr-p-we-001" {
  name                            = var.acr_name
  location                        = azurerm_resource_group.rg-acr-p-we-001.location
  resource_group_name             = azurerm_resource_group.rg-acr-p-we-001.name
  sku                             = var.acr_sku
  admin_enabled                   = var.acr_admin_enabled
  tags                            = var.default_tags
}
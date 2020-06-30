# Create Log Analytics Workspace resource group
resource "azurerm_resource_group" "rg-law-p-we-001" {
  name                            = var.law_rg_name
  location                        = var.law_rg_location
  tags                            = var.default_tags
}

# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "law-p-we-001" {
  name                            = var.law_name
  location                        = azurerm_resource_group.rg-law-p-we-001.location
  resource_group_name             = azurerm_resource_group.rg-law-p-we-001.name
  sku                             = "PerGB2018"
  retention_in_days               = 30
  tags                            = var.default_tags
}

# Create Log Analytics Workspace solution
resource "azurerm_log_analytics_solution" "solutions" {
  for_each                        = var.solutions
  solution_name                   = each.value.solution_Name
  location                        = azurerm_resource_group.rg-law-p-we-001.location
  resource_group_name             = azurerm_resource_group.rg-law-p-we-001.name
  workspace_resource_id           = azurerm_log_analytics_workspace.law-p-we-001.id
  workspace_name                  = azurerm_log_analytics_workspace.law-p-we-001.name
  plan {
    publisher = each.value.publisher
    product   = each.value.product
  }
}
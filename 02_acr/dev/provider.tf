 # Configure the Microsoft Azure provider
provider "azurerm" {
  version                       = "2.16.0"
  features {}
}

terraform {
  required_version              = ">=0.12"
}
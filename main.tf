provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "MyResourceGroup"
  location = "East US"
}

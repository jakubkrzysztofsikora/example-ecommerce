provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "testGroupT"
  location = "Poland Central"
}

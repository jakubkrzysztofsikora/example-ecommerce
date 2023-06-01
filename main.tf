provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "MyResourceGroup"
  location = "East US"
}

terraform {
  backend "azurerm" {
    resource_group_name = "StorageAccount-ResourceGroup"
    storage_account_name = "marcinstorage120397213"
    container_name = "tfstate"
    key = "prod.terraform.tfstate"
  }
}
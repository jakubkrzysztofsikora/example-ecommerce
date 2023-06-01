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
    access_key = "hR+AEvrgdE5s8ZZtrfRjUqWhIB1VibJd9lQe9f9Dgs1CYtFPHFE4kxlDTjCnp98cYKhD4jibtDdU+AStIhiFCQ=="
  }
}

resource "azurerm_app_service_plan" "example" {
  name                = "myAppServicePlan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "myWebApp45321213521"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
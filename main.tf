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
  
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.example.instrumentation_key
  }
}

resource "azurerm_application_insights" "example" {
  name                = "myAppInsights"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

resource "azurerm_sql_server" "example" {
  name                         = "mysqlserver"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  version                      = "12.0"
  administrator_login          = "marcinskorupa"
  administrator_login_password = "myPassword1234!"
}

resource "azurerm_sql_database" "example" {
  name                = "myDatabase"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_sql_server.example.name
  location            = azurerm_resource_group.rg.location
  edition             = "Basic"
}

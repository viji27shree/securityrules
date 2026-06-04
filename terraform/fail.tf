
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "acr-fail-rg"
  location = "East US"
}

resource "azurerm_container_registry" "example" {
  name                = "acrfailregistry123"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Premium"

  admin_enabled = false
}
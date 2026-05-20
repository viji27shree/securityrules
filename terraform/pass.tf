provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "automation-pass-rg"
  location = "East US"
}

resource "azurerm_automation_account" "example" {
  name                = "automationpassacct"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "Basic"

  public_network_access_enabled = false
}
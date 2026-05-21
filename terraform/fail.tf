provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-test"
  location = "East US"
}

# ❌ No azurerm_key_vault present
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "kv-pass-rg"
  location = "East US"
}

resource "azurerm_key_vault" "kv_pass" {
  name                        = "kvpassvault123"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = "00000000-0000-0000-0000-000000000000"
  sku_name                    = "standard"

  purge_protection_enabled    = true
  soft_delete_retention_days  = 30
}
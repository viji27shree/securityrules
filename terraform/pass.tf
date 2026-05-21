resource "azurerm_subscription" "current" {
  subscription_id = "00000000-0000-0000-0000-000000000000"
}

resource "azurerm_key_vault" "example" {
  name                        = "passkeyvault12345"
  location                    = "East US"
  resource_group_name         = "rg-pass"
  tenant_id                   = "11111111-1111-1111-1111-111111111111"
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7
}
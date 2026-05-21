
resource "azurerm_subscription" "example3" {
  subscription_name = "test-subscription"
}

resource "azurerm_resource_group" "example3" {
  name     = "rg-pass"
  location = "East US"
}

resource "azurerm_key_vault" "example3" {
  name                        = "passkeyvault12345"
  location                    = azurerm_resource_group.example3.location
  resource_group_name         = azurerm_resource_group.example3.name
  tenant_id                   = "11111111-1111-1111-1111-111111111111"
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  public_network_access_enabled = false
}
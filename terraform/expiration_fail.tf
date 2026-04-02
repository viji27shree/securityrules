resource "azurerm_key_vault" "example" {
  name                        = "kv-example-123"
  location                    = "East US"
  resource_group_name         = "rg-example"
  tenant_id                   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  sku_name                    = "standard"
}

resource "azurerm_key_vault_secret" "bad_secret" {
  name         = "my-secret"
  value        = "super-secret-value"
  key_vault_id = azurerm_key_vault.example.id

  # ❌ expiration_date is completely missing
}
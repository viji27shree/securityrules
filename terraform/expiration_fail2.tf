resource "azurerm_key_vault_secret" "bad_secret_empty" {
  name         = "my-secret-empty"
  value        = "value"
  key_vault_id = azurerm_key_vault.example.id

  expiration_date = ""  # ❌ empty
}
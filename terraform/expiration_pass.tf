resource "azurerm_key_vault_secret" "good_secret" {
  name         = "my-secret-good"
  value        = "secure-value"
  key_vault_id = azurerm_key_vault.example.id

  expiration_date = "2026-12-31T23:59:59Z"  # ✅ valid
}
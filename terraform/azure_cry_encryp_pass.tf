resource "azurerm_container_registry" "pass_acr" {
  name                = "acrpass123"
  resource_group_name = "rg-test"
  location            = "East US"
  sku                 = "Premium"

  encryption {
    key_vault_key_id   = data.azurerm_key_vault_key.example.id
    identity_client_id = azurerm_user_assigned_identity.example.client_id
  }
}
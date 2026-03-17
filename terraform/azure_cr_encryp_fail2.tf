resource "azurerm_container_registry" "fail_invalid_key" {
  name                = "acrinvalid123"
  resource_group_name = "rg-test"
  location            = "East US"
  sku                 = "Premium"

  encryption {
    key_vault_key_id = "invalid-key"
  }
}
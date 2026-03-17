resource "azurerm_container_registry" "fail_empty_key" {
  name                = "acrempty123"
  resource_group_name = "rg-test"
  location            = "East US"
  sku                 = "Premium"

  encryption {
    key_vault_key_id = ""
  }
}
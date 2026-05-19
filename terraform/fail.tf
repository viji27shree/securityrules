
resource "azurerm_key_vault" "bad_public" {
  name                = "bad-kv-example"
  location            = "East US"
  resource_group_name = "rg-test"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"

  public_network_access_enabled = true

  network_acls {
    default_action = "Deny"
  }
}
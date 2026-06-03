
resource "azurerm_key_vault" "good" {
  name                = "good-kv-example"
  location            = "East US"
  resource_group_name = "rg-test"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"

  public_network_access_enabled = false

  network_acls {
    default_action = "Deny"

    ip_rules = [
      "10.0.0.1"
    ]
  }
}

resource "azurerm_key_vault" "bad_no_acl" {
  name                = "bad-kv-no-acl"
  location            = "East US"
  resource_group_name = "rg-test"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"

  public_network_access_enabled = false
}
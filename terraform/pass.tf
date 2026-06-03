resource "azurerm_key_vault" "pass" {
  name                = "kv-pass-example"
  location            = "East US"
  resource_group_name = "rg-example"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"

  public_network_access_enabled = false

  private_endpoint {
    subresource_names = ["vault"]
  }
}

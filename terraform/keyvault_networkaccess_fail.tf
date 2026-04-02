resource "azurerm_key_vault" "bad_kv_1" {
  name                        = "badkv12345"
  location                    = "East US"
  resource_group_name         = "rg-demo"
  tenant_id                   = "00000000-0000-0000-0000-000000000000"
  sku_name                    = "standard"

  public_network_access_enabled = true
}
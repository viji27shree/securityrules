resource "azurerm_key_vault" "good_kv" {
  name                        = "goodkv12345"
  location                    = "East US"
  resource_group_name         = "rg-demo"
  tenant_id                   = "00000000-0000-0000-0000-000000000000"
  sku_name                    = "standard"

  public_network_access_enabled = false

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = ["192.168.1.0/24"]
  }
}
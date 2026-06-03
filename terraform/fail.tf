# FAIL 1 - No private_endpoint block at all
resource "azurerm_key_vault" "fail_no_pe" {
  name                = "kv-fail-no-pe"
  location            = "East US"
  resource_group_name = "rg-example"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"

  public_network_access_enabled = false
}

# FAIL 2 - private_endpoint exists but wrong subresource_names
resource "azurerm_key_vault" "fail_wrong_subresource" {
  name                = "kv-fail-wrong-sub"
  location            = "East US"
  resource_group_name = "rg-example"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"

  public_network_access_enabled = false

  private_endpoint {
    subresource_names = ["vaultcore"]
  }
}

# FAIL 3 - private_endpoint and subresource correct but public_network_access_enabled = true
resource "azurerm_key_vault" "fail_public_access" {
  name                = "kv-fail-public"
  location            = "East US"
  resource_group_name = "rg-example"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"

  public_network_access_enabled = true

  private_endpoint {
    subresource_names = ["vault"]
  }
}


resource "azurerm_subscription" "current" {
  subscription_id = "00000000-0000-0000-0000-000000000000"
}

resource "azurerm_resource_group" "example" {
  name     = "rg-pass"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "vnet-pass"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "subnet-pass"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_key_vault" "example" {
  name                        = "passkeyvault12345"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = "11111111-1111-1111-1111-111111111111"
  sku_name                    = "standard"

  purge_protection_enabled      = true
  soft_delete_retention_days    = 7
  public_network_access_enabled = false

  network_acls {
    default_action = "Deny"
    bypass         = "None"
  }
}

resource "azurerm_private_endpoint" "kv_pe" {
  name                = "kv-private-endpoint"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "kv-private-connection"
    private_connection_resource_id = azurerm_key_vault.example.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
}
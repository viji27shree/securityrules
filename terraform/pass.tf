
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "acr-pass-rg"
  location = "East US"
}

resource "azurerm_key_vault" "example" {
  name                        = "acrpassvault123"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = "11111111-1111-1111-1111-111111111111"
  sku_name                    = "standard"
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7
}

resource "azurerm_key_vault_key" "example" {
  name         = "acr-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_container_registry" "example" {
  name                = "acrpassregistry123"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Premium"

  encryption {
    enabled            = true
    key_vault_key_id   = azurerm_key_vault_key.example.id
  }

  identity {
    type = "SystemAssigned"
  }
}
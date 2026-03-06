provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "kv-pass-rg"
  location = "East US"
}

resource "azurerm_key_vault" "kv" {
  name                = "kvpass12345"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"
}

resource "azurerm_key_vault_certificate" "cert" {
  name         = "pass-cert"
  key_vault_id = azurerm_key_vault.kv.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    validity_in_months = 12
  }
}
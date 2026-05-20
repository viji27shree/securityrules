provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "kv-cert-fail-rg"
  location = "East US"
}

resource "azurerm_key_vault" "example" {
  name                        = "kvcertfail123"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = "11111111-1111-1111-1111-111111111111"
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7
}

resource "azurerm_key_vault_certificate" "example" {
  name         = "fail-cert"
  key_vault_id = azurerm_key_vault.example.id

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

    x509_certificate_properties {
      validity_in_months = 60
      subject            = "CN=example.com"
    }
  }
}
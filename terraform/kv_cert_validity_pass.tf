#PASS - certificate validity within allowed limit (12 months)
resource "azurerm_key_vault_certificate" "pass" {
  name         = "kv-cert-pass"
  key_vault_id = "/subscriptions/00000000/resourceGroups/rg-example/providers/Microsoft.KeyVault/vaults/kv-example"

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
      validity_in_months = 12
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }
      trigger {
        days_before_expiry = 30
      }
      validity_in_months = 12
    }
  }
}

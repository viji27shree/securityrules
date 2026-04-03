# FAIL 1 - validity_in_months exceeds allowed limit (25 months > MAX_CERT_VALIDITY_MONTHS)
resource "azurerm_key_vault_certificate" "fail_exceeds_limit" {
  name         = "kv-cert-fail-exceeds"
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
      validity_in_months = 25
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }
      trigger {
        days_before_expiry = 30
      }
      validity_in_months = 25
    }
  }
}


# FAIL 2 - multiple lifetime_actions, one exceeds limit
resource "azurerm_key_vault_certificate" "fail_multi_action" {
  name         = "kv-cert-fail-multi"
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

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }
      trigger {
        days_before_expiry = 30
      }
      validity_in_months = 12
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }
      trigger {
        days_before_expiry = 60
      }
      validity_in_months = 36
    }
  }
}

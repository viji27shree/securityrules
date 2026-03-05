/*
provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
}

data "azurerm_client_config" "current" {}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"

  tags = {
    Environment = "Dev"
    Owner       = "SecurityTeam"
    CostCenter  = "CC-1001"
  }
}

# Key Vault
resource "azurerm_key_vault" "example" {
  name                       = "examplekeyvault67890"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }

  tags = {
    Environment = "Dev"
    Owner       = "SecurityTeam"
    CostCenter  = "CC-1001"
  }
}

# PASS CASE
resource "azurerm_key_vault_secret" "example" {
  name            = "secret-sauce"
  value           = "szechuan"
  key_vault_id    = azurerm_key_vault.example.id
  expiration_date = "2026-12-31T00:00:00Z"

  tags = {
    Environment = "Dev"
    Owner       = "SecurityTeam"
    CostCenter  = "CC-1001"
    Reason      = "Testing Key Vault expiration policy"
  }
}*/
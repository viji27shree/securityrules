provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

# ✅ Resource Group with tags
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"

  tags = {
    Environment = "Dev"
    Owner       = "SecurityTeam"
    CostCenter  = "CC-1001"
  }
}

# ✅ Key Vault with tags
resource "azurerm_key_vault" "example" {
  name                       = "examplekeyvault67890"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  tags = {
    Environment = "Dev"
    Owner       = "SecurityTeam"
    CostCenter  = "CC-1001"
  }
}

# ✅ Secret with expiration_date + tags
resource "azurerm_key_vault_secret" "example" {
  name            = "secret-sauce"
  value           = "szechuan"
  key_vault_id    = azurerm_key_vault.example.id
  expiration_date = "2026-12-31T00:00:00Z"

  tags = {
    Environment = "Dev"
    Owner       = "SecurityTeam"
    CostCenter  = "CC-1001"
  }
}
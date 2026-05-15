resource "azurerm_resource_group" "rg_pass" {
  name     = "storage-pass-rg"
  location = "East US"
}

resource "azurerm_storage_account" "sa_pass" {
  name                     = "stgpassenc"
  resource_group_name      = azurerm_resource_group.rg_pass.name
  location                 = azurerm_resource_group.rg_pass.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  encryption {
    services {
      blob {
        enabled = true
      }
    }
    infrastructure_encryption_enabled = true  # ✅ Pass the rule
  }
}
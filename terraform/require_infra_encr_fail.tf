resource "azurerm_resource_group" "rg_fail" {
  name     = "storage-fail-rg"
  location = "East US"
}

resource "azurerm_storage_account" "sa_fail" {
  name                     = "stgfailenc"
  resource_group_name      = azurerm_resource_group.rg_fail.name
  location                 = azurerm_resource_group.rg_fail.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  encryption {
    services {
      blob {
        enabled = true
      }
    }
    infrastructure_encryption_enabled = false  # ❌ Fail the rule
  }
}
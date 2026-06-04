provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "storage-diag-fail-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "diagfailstorage123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  is_hns_enabled = true
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "storage-diag-fail"
  target_resource_id = azurerm_storage_account.example.id

  enabled_log {
    category = "StorageRead"
  }
}
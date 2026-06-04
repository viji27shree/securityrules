provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "storage-diag-pass-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "diagpassstorage123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  is_hns_enabled = true
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = "diag-law-pass"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = "storage-diag"
  target_resource_id         = "${azurerm_storage_account.example.id}/blobServices/default"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }
}
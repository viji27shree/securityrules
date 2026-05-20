provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "diag-pass-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "diagpassstorage123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = "diag-pass-law"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = "diag-setting"
  target_resource_id         = azurerm_storage_account.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  enabled_log {
    category = "allLogs"
    enabled  = true
  }

  enabled_metric {
    category = "AllMetrics"
    enabled  = true
  }
}
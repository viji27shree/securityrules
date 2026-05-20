resource "azurerm_storage_account" "good_storage" {
  name                     = "goodstorage123"
  resource_group_name      = "rg-test"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_monitor_diagnostic_setting" "good_diag" {
  name               = "diag"
  target_resource_id = azurerm_storage_account.good_storage.id

  enabled_log {
    category = "allLogs"
    enabled  = true
  }

  workspace_id = "/subscriptions/xxx/workspaces/test"
}
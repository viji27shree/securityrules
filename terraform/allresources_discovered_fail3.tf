resource "azurerm_monitor_diagnostic_setting" "bad_diag2" {
  name               = "diag"
  target_resource_id = azurerm_storage_account.bad_storage.id

  enabled_log {
    category = "allLogs"
    enabled  = false
  }

  workspace_id = "/subscriptions/xxx/workspaces/test"
}
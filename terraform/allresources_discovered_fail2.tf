resource "azurerm_monitor_diagnostic_setting" "bad_diag" {
  name               = "diag"
  target_resource_id = azurerm_storage_account.bad_storage.id

  enabled_log {
    category = "StorageRead"
    enabled  = true
  }
}
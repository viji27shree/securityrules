resource "azurerm_windows_web_app" "fail_no_destination" {
  name                = "winwebapp-fail-4"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  logs {
    http_logs {
      # ❌ no file_system
      # ❌ no azure_blob_storage
    }

    detailed_error_messages = true
    failed_request_tracing   = true
  }
}
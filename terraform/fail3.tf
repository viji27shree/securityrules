resource "azurerm_windows_web_app" "fail_flags" {
  name                = "winwebapp-fail-3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  logs {
    http_logs {
      file_system = true
    }

    detailed_error_messages = false
    failed_request_tracing   = false
  }
}
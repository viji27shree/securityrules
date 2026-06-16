resource "azurerm_windows_web_app" "pass_file_system" {
  name                = "winwebapp-pass-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  logs {
    http_logs {
      file_system = true
    }

    detailed_error_messages = true
    failed_request_tracing   = true
  }
}
resource "azurerm_windows_web_app" "fail_empty_logs" {
  name                = "winwebapp-fail-2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  logs {
    http_logs = {}
  }
}
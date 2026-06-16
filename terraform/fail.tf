resource "azurerm_windows_web_app" "fail_no_logs" {
  name                = "winwebapp-fail-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  site_config {}
}
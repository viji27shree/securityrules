resource "azurerm_resource_group" "rg" {
  name     = "rg-webapp-pass"
  location = "East US"
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-pass"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "webapp-pass-123"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  logs {
    detailed_error_messages_enabled = true
    failed_request_tracing_enabled  = true

    http_logs {
      storage_account_url = "https://examplestorage.blob.core.windows.net/"
    }
  }
}
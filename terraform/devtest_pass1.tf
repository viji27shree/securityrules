#dev
resource "azurerm_service_plan" "plan_basic" {
  name                = "plan-basic"
  location            = "East US"
  resource_group_name = "rg-dev"
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_windows_web_app" "webapp_dev_ok" {
  name                = "webapp-dev-ok"
  location            = "East US"
  resource_group_name = "rg-dev"
  service_plan_id     = azurerm_service_plan.plan_basic.id

  tags = {
    environment = "dev"
  }

  logs {
    detailed_error_messages_enabled = true
    failed_request_tracing_enabled  = true

    http_logs {
      storage_account_url = "https://dummy.blob.core.windows.net/"
    }
  }
}

resource "azurerm_service_plan" "shared_plan" {
  name                = "shared-service-plan"
  location            = "East US"
  resource_group_name = "rg-test"
  os_type             = "Windows"
  sku_name            = "d1"
}

resource "azurerm_windows_web_app" "shared_app" {
  name                = "shared-windows-app"
  location            = "East US"
  resource_group_name = "rg-test"
  service_plan_id     = azurerm_service_plan.shared_plan.id

  site_config {}

  tags = {
    env = "test"
  }
}
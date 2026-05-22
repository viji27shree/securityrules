resource "azurerm_service_plan" "dev_plan" {
  name                = "dev-service-plan"
  location            = "East US"
  resource_group_name = "rg-dev"
  os_type             = "Windows"
  sku_name            = "F1"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_windows_web_app" "dev_app" {
  name                = "dev-web-app"
  location            = "East US"
  resource_group_name = "rg-dev"
  service_plan_id     = azurerm_service_plan.dev_plan.id

  site_config {}

  tags = {
    environment = "dev"
  }
}
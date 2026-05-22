resource "azurerm_service_plan" "prod_plan" {
  name                = "prod-service-plan"
  location            = "East US"
  resource_group_name = "rg-prod"
  os_type             = "Windows"
  sku_name            = "F1"

  tags = {
    environment = "prod"
  }
}

resource "azurerm_windows_web_app" "prod_app" {
  name                = "prod-web-app"
  location            = "East US"
  resource_group_name = "rg-prod"
  service_plan_id     = azurerm_service_plan.prod_plan.id

  site_config {}

  tags = {
    environment = "prod"
  }
}
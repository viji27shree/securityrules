
resource "azurerm_service_plan" "good_plan" {
  name                = "good-service-plan"
  location            = "East US"
  resource_group_name = "rg-test"
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "good_app" {
  name                = "good-linux-app"
  location            = "East US"
  resource_group_name = "rg-test"
  service_plan_id     = azurerm_service_plan.good_plan.id

  site_config {}

  tags = {
    environment = "dev"
  }
}
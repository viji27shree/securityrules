
resource "azurerm_service_plan" "bad_plan" {
  name                = "bad-service-plan"
  location            = "East US"
  resource_group_name = "rg-test"
  os_type             = "Linux"
  sku_name            = "f1"
}

resource "azurerm_linux_web_app" "bad_app" {
  name                = "bad-linux-app"
  location            = "East US"
  resource_group_name = "rg-test"
  service_plan_id     = azurerm_service_plan.bad_plan.id

  site_config {}

  tags = {
    environment = "dev"
  }
}
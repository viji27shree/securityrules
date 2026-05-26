resource "azurerm_resource_group" "rg" {
  name     = "rg-app-fail"
  location = "East US"
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-fail"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  os_type  = "Linux"
  sku_name = "P1v2"
}

resource "azurerm_linux_web_app" "fail" {
  name                = "linux-webapp-fail-12345"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  client_cert_enabled = false
  client_cert_mode    = "Optional"

  site_config {}
}
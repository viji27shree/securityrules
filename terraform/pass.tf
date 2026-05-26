resource "azurerm_resource_group" "rg" {
  name     = "rg-app-pass"
  location = "East US"
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-pass"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  os_type  = "Linux"
  sku_name = "P1v2"
}

resource "azurerm_linux_web_app" "pass" {
  name                = "linux-webapp-pass-12345"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  client_cert_enabled = true
  client_cert_mode    = "Required"

  site_config {}
}
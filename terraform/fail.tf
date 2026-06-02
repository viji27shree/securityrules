#fail
resource "azurerm_linux_web_app" "example" {
  name                = "example-webapp"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id
}

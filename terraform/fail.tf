resource "azurerm_api_management_backend" "bad" {
  name                = "backend1"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  protocol            = "http"
  url                 = "https://backend.example.com"
}
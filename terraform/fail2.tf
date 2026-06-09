resource "azurerm_mssql_server" "example" {
  name                         = "sqlserverexample123"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"
}
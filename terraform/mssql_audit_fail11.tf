resource "azurerm_resource_group" "rg" {
  name     = "rg-mssql-test"
  location = "East US"
}

resource "azurerm_mssql_server" "server" {
  name                         = "sqlserver-no-audit"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "Password1234!"
}
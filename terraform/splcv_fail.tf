resource "azurerm_resource_group" "rg" {
  name     = "rg-sql-fail"
  location = "East US"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = "sqlserverfail12345"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password1234!"
}
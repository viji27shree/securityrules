provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "sql-fw-pass-rg"
  location = "East US"
}

resource "azurerm_mssql_server" "example" {
  name                         = "sqlserverpass12345"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password1234!"
}

resource "azurerm_mssql_firewall_rule" "pass" {
  name             = "safe-rule"
  server_id        = azurerm_mssql_server.example.id
  start_ip_address = "10.0.0.1"
  end_ip_address   = "10.0.0.10"
}
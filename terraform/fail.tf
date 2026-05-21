provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "sql-fw-fail-rg"
  location = "East US"
}

resource "azurerm_mssql_server" "example" {
  name                         = "sqlserverfail12345"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password1234!"
}

resource "azurerm_mssql_firewall_rule" "fail" {
  name             = "open-rule"
  server_id        = azurerm_mssql_server.example.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
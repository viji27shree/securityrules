#pass.tf :
resource "azurerm_resource_group" "rg" {
  name     = "rg-sql-pass"
  location = "East US"
}

resource "azurerm_mssql_server" "pass" {
  name                         = "sqlserverpass123"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"
}

resource "azurerm_mssql_server_azuread_administrator" "pass" {
  server_id      = azurerm_mssql_server.pass.id
  login_username = "aadadmin"
  object_id      = "11111111-1111-1111-1111-111111111111"
  tenant_id      = "22222222-2222-2222-2222-222222222222"

  azuread_authentication_only = true
}

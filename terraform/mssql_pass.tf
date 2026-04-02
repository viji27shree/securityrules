# PASS - azuread_administrator block with valid login_username and object_id
resource "azurerm_mssql_server" "pass" {
  name                         = "mssql-pass-example"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"

  azuread_administrator {
    login_username = "entra-admin-user"
    object_id      = "00000000-0000-0000-0000-000000000001"
  }
}
# FAIL 1 - No azuread_administrator block at all
resource "azurerm_mssql_server" "fail_no_entra_admin" {
  name                         = "mssql-fail-no-entra"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}


# FAIL 2 - azuread_administrator block missing login_username
resource "azurerm_mssql_server" "fail_no_login_username" {
  name                         = "mssql-fail-no-login"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"

  azuread_administrator {
    object_id = "00000000-0000-0000-0000-000000000002"
  }
}


# FAIL 3 - azuread_administrator block missing object_id
resource "azurerm_mssql_server" "fail_no_object_id" {
  name                         = "mssql-fail-no-object-id"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"

  azuread_administrator {
    login_username = "entra-admin-user"
  }
}

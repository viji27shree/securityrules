resource "azurerm_mysql_server" "pass" {
  name                = "mysqlpass12345"
  location            = "East US"
  resource_group_name = "rg"

  administrator_login          = "adminuser"
  administrator_login_password = "Password123!"
  sku_name                     = "B_Gen5_1"
  version                      = "5.7"

  storage_mb = 5120

  geo_redundant_backup_enabled = true
}
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
}resource "azurerm_mysql_flexible_server" "mysql_pass" {
  name                = "mysql-pass-example"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login    = "adminuser"
  administrator_password = "Password1234!"

  sku_name = "GP_Standard_D2ds_v4"

  storage {
    size_gb = 20
  }

  geo_redundant_backup_enabled = true   # ✅ PASS
}
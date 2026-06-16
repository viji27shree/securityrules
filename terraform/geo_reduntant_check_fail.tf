resource "azurerm_mysql_flexible_server" "mysql_fail" {
  name                = "mysql-fail-example"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login    = "adminuser"
  administrator_password = "Password1234!"

  sku_name = "GP_Standard_D2ds_v4"

  storage {
    size_gb = 20
  }

  # ❌ Missing geo_redundant_backup_enabled (defaults to false)
}
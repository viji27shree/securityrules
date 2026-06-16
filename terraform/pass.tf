resource "azurerm_postgresql_flexible_server" "pg_pass" {
  name                = "pg-pass-example"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login    = "adminuser"
  administrator_password = "Password1234!"

  sku_name = "GP_Standard_D2ds_v4"

  storage_mb = 32768

  geo_redundant_backup_enabled = true   # ✅ PASS
}
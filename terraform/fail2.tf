resource "azurerm_resource_group" "rg" {
  name     = "postgres-rg"
  location = "East US"
}

resource "azurerm_postgresql_flexible_server" "fail2" {
  name                   = "postgres-fail-server"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location

  administrator_login    = "postgresadmin"
  administrator_password = "Password123!"

  version = "14"
  sku_name = "B_Standard_B1ms"

  public_network_access_enabled = true

  storage_mb = 32768
}
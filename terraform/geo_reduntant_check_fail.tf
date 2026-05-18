resource "azurerm_resource_group" "rg" {
  name     = "rg-mysql-fail"
  location = "East US"
}

resource "azurerm_mysql_server" "fail" {
  name                = "mysqlfail12345"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = "adminuser"
  administrator_login_password = "Password123!"
  sku_name                     = "B_Gen5_1"
  version                      = "5.7"

  storage_mb = 5120
}
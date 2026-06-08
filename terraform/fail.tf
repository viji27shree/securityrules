resource "azurerm_resource_group" "example" {
  name     = "rg-redis-test"
  location = "East US"
}

resource "azurerm_redis_cache" "example" {
  name                = "redis-cache-test"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
}
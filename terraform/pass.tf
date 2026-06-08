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

resource "azurerm_virtual_network" "example" {
  name                = "vnet-test"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "endpoint" {
  name                 = "private-endpoint-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]

  private_endpoint_network_policies = "Disabled"
}

resource "azurerm_private_endpoint" "redis_pe" {
  name                = "redis-pe"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.endpoint.id

  private_service_connection {
    name                           = "redis-connection"
    private_connection_resource_id = azurerm_redis_cache.example.id
    subresource_names              = ["redisCache"]
    is_manual_connection           = false
  }
}
resource "azurerm_private_endpoint" "redis_pe" {
  name                = "redis-pe"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.endpoint.id

  private_service_connection {
    name                           = "redis-connection"
    private_connection_resource_id = azurerm_redis_cache.example.id
    subresource_names              = ["wrongValue"]
    is_manual_connection           = false
  }
}
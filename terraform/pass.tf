
resource "azurerm_postgresql_flexible_server" "example" {
  name                = "example-postgres"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  version             = "16"
  sku_name            = "B_Standard_B1ms"

  authentication {
    active_directory_auth_enabled = true
    password_auth_enabled         = false
    tenant_id                     = data.azurerm_client_config.current.tenant_id
  }
}

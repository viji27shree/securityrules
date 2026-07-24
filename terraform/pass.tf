resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_signalr_service" "example" {
  name                = "tfex-signalr"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    name     = "Standard_S1"
    capacity = 1
  }

  # Compliant: public network access explicitly disabled.
  public_network_access_enabled = false
}

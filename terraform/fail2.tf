resource "azurerm_network_security_group" "example" {
  name                = "example-nsg"
  location            = "East US"
  resource_group_name = "example-rg"
}

resource "azurerm_network_security_rule" "unrestricted_inbound" {
  name                        = "allow-all-inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "22"

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = "example-rg"
  network_security_group_name = azurerm_network_security_group.example.name
}
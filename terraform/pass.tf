resource "azurerm_network_security_rule" "restricted_inbound" {
  name                        = "allow-internal"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "22"

  source_address_prefix       = "10.0.0.0/8"
  destination_address_prefix  = "*"

  resource_group_name         = "example-rg"
  network_security_group_name = azurerm_network_security_group.example.name
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "nsg-fail-rg"
  location = "East US"
}

resource "azurerm_network_security_group" "example" {
  name                = "nsg-fail"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_network_security_rule" "allow_rdp_public" {
  name                        = "allow-rdp-public"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example.name
}
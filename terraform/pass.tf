provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "nsg-pass-rg"
  location = "East US"
}

resource "azurerm_network_security_group" "example" {
  name                = "nsg-pass"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_network_security_rule" "deny_rdp_public" {
  name                        = "deny-rdp-public"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example.name
}
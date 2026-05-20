provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "example" {
name     = "patch-pass-rg"
location = "East US"
}

resource "azurerm_virtual_network" "example" {
name                = "patch-pass-vnet"
address_space       = ["10.0.0.0/16"]
location            = azurerm_resource_group.example.location
resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
name                 = "default"
resource_group_name  = azurerm_resource_group.example.name
virtual_network_name = azurerm_virtual_network.example.name
address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
name                = "patch-pass-nic"
location            = azurerm_resource_group.example.location
resource_group_name = azurerm_resource_group.example.name

ip_configuration {
name                          = "internal"
subnet_id                     = azurerm_subnet.example.id
private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_linux_virtual_machine" "example" {
name                = "patch-pass-linuxvm"
resource_group_name = azurerm_resource_group.example.name
location            = azurerm_resource_group.example.location
size                = "Standard_B1s"
admin_username      = "azureuser"

network_interface_ids = [
azurerm_network_interface.example.id
]

patch_mode = "AutomaticByPlatform"

disable_password_authentication = true

admin_ssh_key {
username   = "azureuser"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC"
}

os_disk {
caching              = "ReadWrite"
storage_account_type = "Standard_LRS"
}

source_image_reference {
publisher = "Canonical"
offer     = "0001-com-ubuntu-server-jammy"
sku       = "22_04-lts"
version   = "latest"
}
}

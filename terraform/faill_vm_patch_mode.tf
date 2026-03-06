resource "azurerm_linux_virtual_machine" "example" {
  name = "example-vm"

  patch_mode = "Manual"
}
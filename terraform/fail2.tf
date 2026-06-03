resource "azurerm_linux_virtual_machine" "fail2" {

  admin_username = "azureuser"

  disable_password_authentication = true
}
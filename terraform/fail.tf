resource "azurerm_linux_virtual_machine" "fail" {

  admin_username = "azureuser"

  disable_password_authentication = false

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
}
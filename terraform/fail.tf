resource "azurerm_linux_virtual_machine" "fail" {
  name = "linuxvm-fail"

  encryption_at_host_enabled = false
}
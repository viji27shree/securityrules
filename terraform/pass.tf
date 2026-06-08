
resource "azurerm_resource_group" "example" {
  name     = "rg-site-recovery-pass"
  location = "East US"
}

resource "azurerm_virtual_machine" "vm1" {
  name                  = "vm-pass"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = []
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk-pass"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "vm-pass"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_windows_config {}
}

resource "azurerm_site_recovery_replicated_vm" "replica" {
  name                                    = "replicated-vm-pass"
  resource_group_name                     = azurerm_resource_group.example.name
  recovery_vault_name                     = "vault-pass"
  source_vm_id                            = azurerm_virtual_machine.vm1.id
  recovery_replication_policy_id          = "/subscriptions/xxx/resourceGroups/rg/providers/Microsoft.RecoveryServices/vaults/vault-pass/replicationPolicies/policy1"
}
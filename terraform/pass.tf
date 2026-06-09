resource "azurerm_storage_account" "good" {
  name                     = "storageacctgood123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"

    virtual_network_subnet_ids = [
      azurerm_subnet.example.id
    ]
  }
}
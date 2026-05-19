resource "azurerm_resource_group" "rg" {
  name     = "storage-rg"
  location = "East US"
}

resource "azurerm_storage_account" "bad_storage_no_pe" {
  name                     = "badstorageacct456"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  public_network_access_enabled = false
}
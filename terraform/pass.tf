resource "azurerm_resource_group" "rg" {
  name     = "rg-storage-pass"
  location = "East US"
}

resource "azurerm_storage_account" "secure_storage" {
  name                     = "securestorageacct01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  public_network_access_enabled = false

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}
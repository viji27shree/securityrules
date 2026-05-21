resource "azurerm_resource_group" "rg" {
  name     = "rg-storage-fail"
  location = "East US"
}

resource "azurerm_storage_account" "insecure_storage" {
  name                     = "insecurestorage01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  public_network_access_enabled = true

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }
}
resource "azurerm_storage_account" "bad_storage" {
  name                     = "badstorage123"
  resource_group_name      = "rg-test"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
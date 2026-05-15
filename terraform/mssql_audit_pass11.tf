resource "azurerm_storage_account" "storage" {
  name                     = "mssqlauditstorage123"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server_extended_auditing_policy" "audit" {
  server_id                     = azurerm_mssql_server.server.id
  storage_endpoint              = azurerm_storage_account.storage.primary_blob_endpoint
  storage_account_access_key    = azurerm_storage_account.storage.primary_access_key
}
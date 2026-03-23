resource "azurerm_mssql_server_extended_auditing_policy" "audit" {
  server_id        = azurerm_mssql_server.server.id
  storage_endpoint = "https://examplestorage.blob.core.windows.net/"
}
resource "azurerm_synapse_workspace" "fail2" {
  name                                 = "synapse-fail2"
  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = azurerm_resource_group.rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.fs.id

  sql_administrator_login          = "sqladmin"
  sql_administrator_login_password = "Password123!"

  azuread_authentication_only = true
}
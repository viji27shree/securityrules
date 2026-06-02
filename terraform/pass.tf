resource "azurerm_synapse_workspace" "pass" {
  name                                 = "synapse-pass"
  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = azurerm_resource_group.rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.fs.id

  sql_administrator_login              = "sqladmin"
  sql_administrator_login_password     = "Password123!"

  azuread_authentication_only = true

  aad_admin {
    login     = "aadadmin"
    object_id = "11111111-1111-1111-1111-111111111111"
    tenant_id = "22222222-2222-2222-2222-222222222222"
  }
}

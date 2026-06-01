resource "azurerm_resource_group" "rg" {
  name     = "rg-pass"
  location = "West Europe"
}

resource "azurerm_mssql_server" "prod_sql" {
  name                         = "prod-sql-server"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"
}

resource "azurerm_mssql_server_security_alert_policy" "prod_sql" {
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mssql_server.prod_sql.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "prod_sql" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.prod_sql.id

  storage_container_path = "https://storage.blob.core.windows.net/va/"

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails                    = ["security@example.com"]
  }
}
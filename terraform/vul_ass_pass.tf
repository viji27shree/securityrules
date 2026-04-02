# PASS - server with fully valid vulnerability assessment
resource "azurerm_mssql_server" "pass" {
  name                         = "mssql-pass-example"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_mssql_server_vulnerability_assessment" "pass" {
  server_security_alert_policy_id = azurerm_mssql_server.pass.id
  server_id                       = azurerm_mssql_server.pass.id
  storage_container_path          = "https://storageaccount.blob.core.windows.net/va/"

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    email_addresses           = ["security@example.com"]
  }
}

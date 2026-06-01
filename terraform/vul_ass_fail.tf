resource "azurerm_mssql_server_vulnerability_assessment" "prod_sql" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.prod_sql.id

  storage_container_path = "https://storage.blob.core.windows.net/va/"

  recurring_scans {
    enabled                   = false
    email_subscription_admins = true
    emails                    = ["security@example.com"]
  }
}
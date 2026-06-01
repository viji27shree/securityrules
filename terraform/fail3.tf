resource "azurerm_mssql_server_vulnerability_assessment" "prod_sql" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.prod_sql.id

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails                    = ["security@example.com"]
  }
}
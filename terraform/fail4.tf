resource "azurerm_mssql_server_vulnerability_assessment" "prod_sql" {
  server_security_alert_policy_id = ""

  storage_container_path = "https://storage.blob.core.windows.net/va/"

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails                    = ["security@example.com"]
  }
}
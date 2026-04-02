# FAIL 1 - No vulnerability assessment resource linked to server
resource "azurerm_mssql_server" "fail_no_va" {
  name                         = "mssql-fail-no-va"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}


# FAIL 2 - recurring_scans enabled = false
resource "azurerm_mssql_server" "fail_disabled" {
  name                         = "mssql-fail-disabled"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_mssql_server_vulnerability_assessment" "fail_disabled" {
  server_security_alert_policy_id = azurerm_mssql_server.fail_disabled.id
  server_id                       = azurerm_mssql_server.fail_disabled.id
  storage_container_path          = "https://storageaccount.blob.core.windows.net/va/"

  recurring_scans {
    enabled                   = false
    email_subscription_admins = true
    email_addresses           = ["security@example.com"]
  }
}


# FAIL 3 - No storage_container_path
resource "azurerm_mssql_server" "fail_no_storage" {
  name                         = "mssql-fail-no-storage"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_mssql_server_vulnerability_assessment" "fail_no_storage" {
  server_security_alert_policy_id = azurerm_mssql_server.fail_no_storage.id
  server_id                       = azurerm_mssql_server.fail_no_storage.id

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    email_addresses           = ["security@example.com"]
  }
}


# FAIL 4 - No email_addresses and email_subscription_admins = false
resource "azurerm_mssql_server" "fail_no_notify" {
  name                         = "mssql-fail-no-notify"
  resource_group_name          = "rg-example"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_mssql_server_vulnerability_assessment" "fail_no_notify" {
  server_security_alert_policy_id = azurerm_mssql_server.fail_no_notify.id
  server_id                       = azurerm_mssql_server.fail_no_notify.id
  storage_container_path          = "https://storageaccount.blob.core.windows.net/va/"

  recurring_scans {
    enabled                   = true
    email_subscription_admins = false
  }
}

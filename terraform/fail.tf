resource "azurerm_postgresql_flexible_server" "fail" {

  authentication {
    active_directory_auth_enabled = true
    password_auth_enabled         = true
  }
}
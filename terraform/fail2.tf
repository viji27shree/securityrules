
resource "azurerm_postgresql_flexible_server" "fail2" {

  authentication {
    active_directory_auth_enabled = false
    password_auth_enabled         = true
  }
}
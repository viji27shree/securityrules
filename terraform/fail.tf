provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "security-contact-fail-rg"
  location = "East US"
}

resource "azurerm_security_center_contact" "fail" {
  email               = "admin@example.com"
  phone               = "+1-555-555-5555"

  alerts_to_admins    = false
  alert_notifications = false
}
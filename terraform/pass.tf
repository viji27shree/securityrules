provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "security-contact-pass-rg"
  location = "East US"
}

resource "azurerm_security_center_contact" "pass" {
  email               = "admin@example.com"
  phone               = "+1-555-555-5555"

  alerts_to_admins    = true
  alert_notifications = true
}
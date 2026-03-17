resource "azurerm_container_registry" "fail_no_encryption" {
  name                = "acrnoenc123"
  resource_group_name = "rg-test"
  location            = "East US"
  sku                 = "Premium"
}
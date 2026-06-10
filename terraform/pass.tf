resource "azurerm_resource_group" "example" {
  name     = "rg-function-pass"
  location = "East US"
}

resource "azurerm_service_plan" "example" {
  name                = "asp-function-pass"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  os_type  = "Linux"
  sku_name = "Y1"
}

resource "azurerm_storage_account" "example" {
  name                     = "funcstoragepass123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_linux_function_app" "pass" {
  name                = "func-app-pass"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  service_plan_id            = azurerm_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  https_only = true

  site_config {}
}
resource "azurerm_resource_group" "example" {
  name     = "webapp-rg"
  location = "East US"
}

resource "azurerm_service_plan" "example" {
  name                = "webapp-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Windows"
  sku_name            = "S1"
}

resource "azurerm_storage_account" "example" {
  name                     = "webapplogstore1234"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_windows_web_app" "example" {
  name                = "windows-webapp-pass"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}

  logs {
    detailed_error_messages = true
    failed_request_tracing  = true

    http_logs {
      azure_blob_storage {
        retention_in_days = 7
        sas_url           = "https://storage.blob.core.windows.net/logs?sastoken"
      }
    }
  }
}
resource "azurerm_windows_web_app" "example" {
  name                = "windows-webapp-fail"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}

  logs {
    failed_request_tracing = true

    http_logs {
      azure_blob_storage {
        retention_in_days = 7
        sas_url           = "https://storage.blob.core.windows.net/logs?sastoken"
      }
    }
  }
}
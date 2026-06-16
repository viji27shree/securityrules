resource "azurerm_windows_web_app" "pass_blob" {
  name                = "winwebapp-pass-2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  logs {
    http_logs {
      azure_blob_storage {
        sas_url = "https://examplestorage.blob.core.windows.net/logs?sasToken=xyz"
      }
    }

    detailed_error_messages = true
    failed_request_tracing   = true
  }
}
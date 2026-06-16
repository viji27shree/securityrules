resource "azurerm_windows_web_app" "pass_both" {
  name                = "winwebapp-pass-3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  logs {
    http_logs {
      file_system = true

      azure_blob_storage {
        sas_url = "https://examplestorage.blob.core.windows.net/logs?sasToken=abc"
      }
    }

    detailed_error_messages = true
    failed_request_tracing   = true
  }
}
resource "azurerm_resource_group" "rg" {
  name     = "logicapp-rg"
  location = "East US"
}

resource "azurerm_logic_app_workflow" "bad_logic_app" {
  name                = "bad-logic-app-2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_monitor_diagnostic_setting" "bad_diag" {
  name               = "logicapp-diagnostics"
  target_resource_id = azurerm_logic_app_workflow.bad_logic_app.id

  enabled_log {
    category = "WorkflowRuntime"
  }
}
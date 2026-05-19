resource "azurerm_resource_group" "rg" {
  name     = "logicapp-rg"
  location = "East US"
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "logicapp-law"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_logic_app_workflow" "good_logic_app" {
  name                = "good-logic-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_monitor_diagnostic_setting" "good_diag" {
  name                       = "logicapp-diagnostics"
  target_resource_id         = azurerm_logic_app_workflow.good_logic_app.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  enabled_log {
    category = "WorkflowRuntime"
  }
}
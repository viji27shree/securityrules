resource "azurerm_resource_group" "rg" {
  name     = "rg-ai-pass"
  location = "East US"
}

resource "azurerm_cognitive_account" "pass" {
  name                = "cognitivepass123"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind     = "CognitiveServices"
  sku_name = "S0"

  local_auth_enabled = false
}

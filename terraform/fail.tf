resource "azurerm_cognitive_account" "bad" {
  name                = "example-openai"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "OpenAI"
  sku_name            = "S0"

  network_acls {
    default_action = "Allow"
  }
}
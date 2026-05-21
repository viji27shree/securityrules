resource "azurerm_resource_group" "rg" {
  name     = "storage-rg"
  location = "East US"
}

resource "azurerm_storage_account" "bad_storage_subresource" {
  name                     = "badstorageacct789"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  public_network_access_enabled = false
}

resource "azurerm_virtual_network" "vnet" {
  name                = "storage-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "storage-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.2.1.0/24"]
}

resource "azurerm_private_endpoint" "bad_pe" {
  name                = "storage-pe"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "storage-connection"
    private_connection_resource_id = azurerm_storage_account.bad_storage_subresource.id
    subresource_names              = ["web"]
    is_manual_connection           = false
  }
}
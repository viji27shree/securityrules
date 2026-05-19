resource "azurerm_resource_group" "rg" {
  name     = "storage-rg"
  location = "East US"
}

resource "azurerm_storage_account" "good_storage" {
  name                     = "goodstorageacct123"
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
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "storage-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_private_endpoint" "good_pe" {
  name                = "storage-pe"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "storage-connection"
    private_connection_resource_id = azurerm_storage_account.good_storage.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}
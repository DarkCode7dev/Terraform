variable "app-code" {}
variable "ips_allowed" {
  
}
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.app-code}"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.app-code}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 ="snet-${var.app-code}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
}

resource "azurerm_storage_account" "stg" {
  name                = "dhondhustg123"
  resource_group_name = azurerm_resource_group.rg.name

  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  dynamic network_rules {
    for_each = var.ips_allowed== null ? {} : {key =1}
    content {
      default_action             = "Deny"
    ip_rules                   = var.ips_allowed
    }
    
    # virtual_network_subnet_ids = [azurerm_subnet.subnet.id]
  }

  
}
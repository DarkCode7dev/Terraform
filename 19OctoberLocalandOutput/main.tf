
resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name 
  location = var.location
  tags =merge(local.common_tag,local.rg_tags)
}

resource "azurerm_storage_account" "stg" {
  name                     = var.st_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
   tags =merge(local.common_tag,local.st_tags)
}


resource "azurerm_virtual_network" "vnet" {
  name                     = var.st_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
 address_space = ["10.0.0.0/16"]
  tags =local.common_tag
}

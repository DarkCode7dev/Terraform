#  admin_username      = data.azurerm_key_vault_secret.username  #"adminuser"
#   admin_password = data.azurerm_key_vault_secret.password  #"Adminuser1@"

# data "azurerm_subnet" "devessubnetdata" {
#   name                 = "devessubnet"
#   virtual_network_name = "deves-vnet"
#   resource_group_name  = "deves-rg"
# }

data "azurerm_key_vault" "kv"{
  name                 = "devesvault"
  resource_group_name  = "deves-rg"
}

data "azurerm_key_vault_secret" "username"{
 name = "devesusername"
 key_vault_id = data.azurerm_key_vault.kv.id

}

data "azurerm_key_vault_secret" "password"{
 name = "devesvmpassword"
 key_vault_id = data.azurerm_key_vault.kv.id

}
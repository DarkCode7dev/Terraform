variable "vnets" {}
variable "rgs" {}
variable "subnets" {}
variable "vms" {}
variable "bastions" {}
variable "key_vaults" {}


module "rg" {
  source     = "../../modules/azurerm_resource_group"
  rg_details = var.rgs
}

module "vnet" {
  depends_on   = [module.rg]
  source       = "../../modules/azurerm_virtual_network"
  vnet_details = var.vnets
}


module "key_vault" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}
module "subnets" {
  depends_on = [module.vnet]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}


# module "bastion" {
#   depends_on = [module.subnets]
#   source     = "../../modules/azurerm_bastion"
#   bastions   = var.bastions
# }

module "vms" {
  depends_on = [module.subnets]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}


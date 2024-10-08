rgs = {
  rg1 = {
    name     = "rg-dev-zelectric"
    location = "centralus"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-zelectric"
    resource_group_name = "rg-dev-zelectric"
    location            = "centralus"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name             = "frontend-subnet"
    rg_name          = "rg-dev-zelectric"
    vnet_name        = "vnet-zelectric"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    name             = "backend-subnet"
    rg_name          = "rg-dev-zelectric"
    vnet_name        = "vnet-zelectric"
    address_prefixes = ["10.0.2.0/24"]
  }
  subnet3 = {
    name             = "AzureBastionSubnet"
    rg_name          = "rg-dev-zelectric"
    vnet_name        = "vnet-zelectric"
    address_prefixes = ["10.0.3.0/24"]
  }
}

vms = {
  vm1 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-zelectric"
    resource_group_name  = "rg-dev-zelectric"
    nic_name             = "frontendvm1-nic"
    location             = "centralus"
    vm_name              = "frontendvm1"
    size                 = "Standard_F2"
  }
  vm2 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-zelectric"
    resource_group_name  = "rg-dev-zelectric"
    nic_name             = "frontendvm2-nic"
    location             = "centralus"
    vm_name              = "frontendvm2"
    size                 = "Standard_F2"
  }
}


bastions = {
  bastion1 = {
    vnet_name    = "vnet-zelectric"
    rg_name      = "rg-dev-zelectric"
    pip_name     = "ze-pip-bastion"
    location     = "centralus"
    bastion_name = "bastion-zelectic"
  }
}
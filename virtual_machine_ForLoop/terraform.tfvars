vms = {
  vm1 = {
    subnet_name          = "default"
    virtual_network_name = "deves-vnet"
    resource_group_name  = "deves-rg"
    nic_name             = "vm1-nic"
    location             = "centralindia"
    vm_name              = "bhootiyavm1"
    size                 = "Standard_F2"
  }
  vm2 = {
    subnet_name          = "default"
    virtual_network_name = "deves-vnet"
    resource_group_name  = "deves-rg"
    nic_name             = "vm2-nic"
    location             = "centralindia"
    vm_name              = "bhootiyavm2"
    size                 = "Standard_F2"
  }
}
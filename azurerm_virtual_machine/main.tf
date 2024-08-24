resource "azurerm_public_ip" "pip" {
  name                = "zelectric-vm-pip"
  resource_group_name = "deves-rg"
  location            = "centralindia"
  allocation_method   = "Static"
}



resource "azurerm_network_interface" "nic" {
  name                = "zelectric-nic"
  location            = "centralindia"
  resource_group_name = "deves-rg"

  ip_configuration {
    name                          = "deveships"
    subnet_id                     = data.azurerm_subnet.devessubnetdata.id #dta_source file me hai
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  name                = "jarvisdeves"
  resource_group_name = "deves-rg"
  location            = "centralindia"
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
 disable_password_authentication = false
  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
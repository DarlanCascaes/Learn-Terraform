#Creating the VMs whici will be hosting the WEB page
resource "azurerm_windowsvirtual_machine" "terraform_lab_vm1" {
  name = "terraform-lab-vm1"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171010357883"
  network_interface_ids = azurerm_network_interface.terraform_lab_nic1.id
  vm_size = standard_B1s
  os_disk {
    name = "terraform-lab-vm1-disk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference{
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-azure-edition"
    version   = "latest"
  }

}

resource "azurerm_windows_virtual_machine" "terraform_lab_vm2" {
  name = "terraform-lab-vm2"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171010357883"
  network_interface_ids = azurerm_network_interface.terraform_lab_nic2.id
  size = standard_B1s
  admin_username = "dcascaes"
  admin_password = "dcascaes666"
  os_disk {
    name = "terraform-lab-vm2-disk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference{
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-azure-edition"
    version   = "latest"
  }

}
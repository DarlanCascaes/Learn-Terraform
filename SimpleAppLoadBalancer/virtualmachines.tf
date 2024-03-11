#Creating the VMs whici will be hosting the WEB page
resource "azurerm_windows_virtual_machine" "terraform_lab_vm1" {
  name = "terraformlab1"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_17101598418"
  network_interface_ids = [azurerm_network_interface.terraform_lab_nic1.id]
  size = "standard_B2ms"
  admin_username = "dcascaes"
  admin_password = "Dcascaes666"

  os_disk {
    name = "terraformlab1-disk"
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

resource "azurerm_virtual_machine_extension" "terraform_lab_vm1_extension" {
  virtual_machine_id = azurerm_windows_virtual_machine.terraform_lab_vm1.id
  publisher = "Microsoft.Compute"
  name = "terraform-lab-vm1-extension-iis"
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    } 
SETTINGS
}

resource "azurerm_windows_virtual_machine" "terraform_lab_vm2" {
  name = "terraformlab2"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_17101598418"
  network_interface_ids = [azurerm_network_interface.terraform_lab_nic2.id]
  size = "standard_B2ms"
  admin_username = "dcascaes"
  admin_password = "Dcascaes666"
  os_disk {
    name = "terraformlab2-disk"
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

resource "azurerm_virtual_machine_extension" "terraform_lab_vm2_extension" {
  virtual_machine_id = azurerm_windows_virtual_machine.terraform_lab_vm2.id
  publisher = "Microsoft.Compute"
  name = "terraform-lab-vm1-extension-iis"
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    } 
SETTINGS
}
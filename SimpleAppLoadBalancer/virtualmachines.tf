#Creating the VMs whici will be hosting the WEB page
resource "azurerm_windows_virtual_machine" "vmcasclabtest01" {
  name = "vmcasclabtest01"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_17107176117"
  network_interface_ids = [azurerm_network_interface.nic-01-vmcasclab1-test-001.id]
  size = "standard_B2ms"
  admin_username = "dcascaes"
  admin_password = "Dcascaes666"

  os_disk {
    name = "stcasclab001"
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

resource "azurerm_virtual_machine_extension" "ext-casclab-test-001" {
  virtual_machine_id = azurerm_windows_virtual_machine.vmcasclabtest01.id
  publisher = "Microsoft.Compute"
  name = "ext-casclab-test-002"
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    } 
SETTINGS
}

resource "azurerm_windows_virtual_machine" "vmcasclabtest02" {
  name = "vmcasclabtest02"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_17107176117"
  network_interface_ids = [azurerm_network_interface.nic-02-vmcasclab2-test-001.id]
  size = "standard_B2ms"
  admin_username = "dcascaes"
  admin_password = "Dcascaes666"
  os_disk {
    name = "stcasclab002"
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

resource "azurerm_virtual_machine_extension" "ext-casclab-test-002" {
  virtual_machine_id = azurerm_windows_virtual_machine.vmcasclabtest02.id
  publisher = "Microsoft.Compute"
  name = "ext-casclab-test-002"
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    } 
SETTINGS
}
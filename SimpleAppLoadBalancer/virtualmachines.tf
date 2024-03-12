#Creating the VMs whici will be hosting the WEB page
resource "azurerm_windows_virtual_machine" "vm-casclab-test-001" {
  name = "vm-casclab-test-001"
  location = "eastus"
  resource_group_name = ""
  network_interface_ids = [azurerm_network_interface.nic-01-vmcasclab1-test-001.id]
  size = "standard_B2ms"
  admin_username = ""
  admin_password = ""

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

resource "azurerm_virtual_machine_extension" "ex-casclab-test-001" {
  virtual_machine_id = azurerm_windows_virtual_machine.vm-casclab-test-001.id
  publisher = "Microsoft.Compute"
  name = "ex-casclab-test-002"
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    } 
SETTINGS
}

resource "azurerm_windows_virtual_machine" "vm-casclab-test-002" {
  name = "vm-casclab-test-002"
  location = "eastus"
  resource_group_name = ""
  network_interface_ids = [azurerm_network_interface.nic-02-vmcasclab2-test-001.id]
  size = "standard_B2ms"
  admin_username = ""
  admin_password = ""
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

resource "azurerm_virtual_machine_extension" "ex-casclab-test-002" {
  virtual_machine_id = azurerm_windows_virtual_machine.vm-casclab-test-002.id
  publisher = "Microsoft.Compute"
  name = "ex-casclab-test-002"
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    } 
SETTINGS
}
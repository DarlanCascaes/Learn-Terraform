#Creating the VMs whici will be hosting the WEB page
resource "azurerm_windows_virtual_machine" "vmcasclabtest01" {
  name = "vmcasclabtest01"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic_01_vmcasclab1_test_001.id]
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

resource "azurerm_virtual_machine_extension" "ext_casclab_test_001" {
  virtual_machine_id = azurerm_windows_virtual_machine.vmcasclabtest01.id
  publisher = "Microsoft.Compute"
  name = "ext-casclab-test-001"
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
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic_02_vmcasclab2_test_001.id]
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

resource "azurerm_virtual_machine_extension" "ext_casclab_test_002" {
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


resource "azurerm_network_interface" "nic_01_vmcasclab1_test_001" {
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    name = "nic-01-vmcasclab1-test-001"
    ip_configuration {
        name = "nic-01-vmcasclab1-test-001-ipc"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.pip_vmcasclab01_test_eastus_001.id
        subnet_id = azurerm_subnet.snet_test_eastus_001.id

    }
  
}

resource "azurerm_network_interface" "nic_02_vmcasclab2_test_001" {
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    name = "nic-02-vmcasclab2-test-001"
    ip_configuration {
        name = "nic-02-vmcasclab2-test-001-ipc"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.pip_vmcasclab02_test_eastus_001.id
        subnet_id = azurerm_subnet.snet_test_eastus_001.id

    }
  
}
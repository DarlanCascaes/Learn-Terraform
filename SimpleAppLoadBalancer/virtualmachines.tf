#Creating the VMs whici will be hosting the WEB page
resource "azurerm_windows_virtual_machine" "this" {
  for_each = var.vm_properties
  name = each.value.name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.this[each.key].id]
  size = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  os_disk {
    name = each.value.os_disk_name
    caching = "ReadWrite"
    storage_account_type = each.value.storage_type
  }
  source_image_reference{
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-azure-edition"
    version   = "latest"
  }

}

resource "azurerm_virtual_machine_extension" "this" {
  for_each = var.vm_properties
  name = "ext-${each.value.name}"
  virtual_machine_id = azurerm_windows_virtual_machine.this[each.key].id
  publisher = "Microsoft.Compute"
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    } 
SETTINGS
}



resource "azurerm_network_interface" "this" {
  for_each = var.vm_properties
    name = "nic-01-${each.value.name}"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    ip_configuration {
        name = "nic-01-${each.value.name}-ipc"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = (each.value.name == "vmcasclabtest01") ? azurerm_public_ip.pip_vmcasclab01_test_eastus_001.id : azurerm_public_ip.pip_vmcasclab02_test_eastus_001.id
        subnet_id = azurerm_subnet.snet_test_eastus_001.id

    }
  
}

resource "azurerm_network_interface" "nic-01-vmcasclab1-test-001" {
    resource_group_name = "rg_sb_eastus_40287_1_171024271790"
    location = "eastus"
    name = "nic-01-vmcasclab1-test-001"
    ip_configuration {
        name = "nic-01-vmcasclab1-test-001-ipc"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.pip-vmcasclab01-test-eastus-001.id
        subnet_id = azurerm_subnet.snet-test-eastus-001.id

    }
  
}

resource "azurerm_network_interface" "nic-02-vmcasclab2-test-001" {
    resource_group_name = "rg_sb_eastus_40287_1_171024271790"
    location = "eastus"
    name = "nic-02-vmcasclab2-test-001"
    ip_configuration {
        name = "nic-02-vmcasclab2-test-001-ipc"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.pip-vmcasclab02-test-eastus-001.id
        subnet_id = azurerm_subnet.snet-test-eastus-001.id

    }
  
}
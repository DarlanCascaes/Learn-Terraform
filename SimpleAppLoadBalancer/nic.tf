
resource "azurerm_network_interface" "terraform_lab_nic1" {
    resource_group_name = ""
    location = "eastus"
    name = "terraform-lab-nic1"
    ip_configuration {
        name = "terraform-lab-nic1-ipc"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.terraform_lab_vm1_pip.id
        subnet_id = azurerm_subnet.terraform_lab_subnet.id

    }
  
}

resource "azurerm_network_interface" "terraform_lab_nic2" {
    resource_group_name = ""
    location = "eastus"
    name = "terraform-lab-nic2"
    ip_configuration {
        name = "terraform-lab-nic2-ipc"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.terraform_lab_vm2_pip.id
        subnet_id = azurerm_subnet.terraform_lab_subnet.id

    }
  
}
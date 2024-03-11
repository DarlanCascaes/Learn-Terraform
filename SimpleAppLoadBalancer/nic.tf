
resource "azurerm_network_interface" "terraform_lab_nic1" {
    resource_group_name = "rg_sb_eastus_40287_1_171012527887"
    location = "eastus"
    name = "terraform-lab-nic1"
    ip_configuration {
        name = "terraform-lab-nic1-ipc"
        private_ip_address_allocation = "Dynamic"
        subnet_id = azurerm_subnet.terraform_lab_subnet.id

    }
  
}

resource "azurerm_network_interface" "terraform_lab_nic2" {
    resource_group_name = "rg_sb_eastus_40287_1_171012527887"
    location = "eastus"
    name = "terraform-lab-nic2"
    ip_configuration {
        name = "terraform-lab-nic2-ipc"
        private_ip_address_allocation = "Dynamic"
        subnet_id = azurerm_subnet.terraform_lab_subnet.id

    }
  
}
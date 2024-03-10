terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}

provider "azurerm"{
  features {}
  skip_provider_registration = "true"
}

resource "azurerm_network_interface" "terraform_lab_nic" {
    count = 2
    resource_group_name = "rg_sb_eastus_40287_1_171010357883"
    location = "eastus"
    name = "terraform_lab_nic-${count.index + 1}"
    ip_configuration {
        name = "terraform_lab_nic-${count.index + 1}_ipc"
        private_ip_address_allocation = "Dynamic"
        subnet_id = azurerm_subnet.terraform_lab_subnet.id
        public_ip_address_id = azurerm_public_ip.terraform_lab_pip.id

    }
  
}
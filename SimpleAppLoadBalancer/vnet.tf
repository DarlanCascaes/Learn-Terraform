terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.91.0"
        }
    }
}

#Creating the virtual network which will be used for LB and VMs
resource "azurerm_virtual_network" "terraform_lab_vnet" {
  name = "terraform-lab-vnet"
  address_space = ["10.1.0.0/16"]
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171010357883"
}
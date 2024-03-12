#Creating the virtual network which will be used for LB and VMs
resource "azurerm_virtual_network" "terraform_lab_vnet" {
  name = "terraform-lab-vnet"
  address_space = ["10.1.0.0/16"]
  location = "eastus"
  resource_group_name = ""
}
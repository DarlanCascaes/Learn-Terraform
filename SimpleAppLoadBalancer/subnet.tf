#Creating subnet for @Vnet which will be used for LB and VMs
resource "azurerm_subnet" "terraform_lab_subnet" {
  name = "terraform-lab-snet"
  virtual_network_name = azurerm_virtual_network.terraform_lab_vnet.name
  address_prefixes = ["10.1.0.0/24"]
  resource_group_name = "rg_sb_eastus_40287_1_171012527887"
}
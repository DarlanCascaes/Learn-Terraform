#Creating the public ip which will be used for @LoadBalancer
resource "azurerm_public_ip" "terraform_lab_pip" {
  name = "terraform-lab-pip"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171012527887"
  allocation_method = "Static"
  sku = "Standard"
}
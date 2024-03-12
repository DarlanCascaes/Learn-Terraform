#Creating the public ip which will be used for @LoadBalancer
resource "azurerm_public_ip" "terraform_lab_pip" {
  name = "terraform-lab-pip"
  location = "eastus"
  resource_group_name = ""
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_public_ip" "terraform_lab_vm1_pip" {
  name = "terraform-lab-vm1-pip"
  location = "eastus"
  resource_group_name = ""
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_public_ip" "terraform_lab_vm2_pip" {
  name = "terraform-lab-vm2-pip"
  location = "eastus"
  resource_group_name = ""
  allocation_method = "Static"
  sku = "Standard"
}

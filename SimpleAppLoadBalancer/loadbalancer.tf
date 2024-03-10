terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.91.0"
        }
    }
}

resource "azurerm_lb" "terraform_lab_lb" {
  name = "terraform-lab-lb"
  resource_group_name = "rg_sb_eastus_40287_1_171010357883"
  sku = "Standard"
  location = "eastus"

  frontend_ip_configuration {
    name = "terraform-lab-fip"
    public_ip_address_id = "terraform-lab-pip"
    }      
}

resource "azurerm_lb_backend_address_pool" "terraform_lab_bp" {
    name = "terraform-lab-bp"
    loadbalancer_id = azurerm_lb.terraform_lab_lb.id
    virtual_network_id = terraform.lab.vnet.id
}

resource "azurerm_network_interface_backend_address_pool_association" "terraform_lab_lbas" {
  backend_address_pool_id = azurerm_lb.terraform_lab_lb.id
  ip_configuration_name = "terraform-lab-bp-config"
  network_interface_id = azurerm_network_interface.terraform_lab_nic.ip_configuration.name[count.index]

}
terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.91.0"
        }
    }
}

provider "azurerm"{
    features{}
    skip_provider_registration = "true"
}

resource "azurerm_lb" "terraform_lab_lb" {
  name = "terraform-lab-lb"
  resource_group_name = "rg_sb_eastus_40287_1_17101598418"
  sku = "Standard"
  location = "eastus"

  frontend_ip_configuration {
    name = "terraform-lab-fip"
    public_ip_address_id = azurerm_public_ip.terraform_lab_pip.id
    //subnet_id = azurerm_subnet.terraform_lab_subnet.id
    }      
}

resource "azurerm_lb_backend_address_pool" "terraform_lab_bp" {
    name = "terraform-lab-bp"
    loadbalancer_id = azurerm_lb.terraform_lab_lb.id
    virtual_network_id = azurerm_virtual_network.terraform_lab_vnet.id
}

resource "azurerm_lb_backend_address_pool_address" "terraform_lab_lbap1" {
  name = "terraform_lab-ada1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.terraform_lab_bp.id
  virtual_network_id = azurerm_virtual_network.terraform_lab_vnet.id
  ip_address = azurerm_windows_virtual_machine.terraform_lab_vm1.private_ip_address

}

resource "azurerm_lb_backend_address_pool_address" "terraform_lab_lbap2" {
  name = "terraform_lab-ada2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.terraform_lab_bp.id
  virtual_network_id = azurerm_virtual_network.terraform_lab_vnet.id
  ip_address = azurerm_windows_virtual_machine.terraform_lab_vm2.private_ip_address
}
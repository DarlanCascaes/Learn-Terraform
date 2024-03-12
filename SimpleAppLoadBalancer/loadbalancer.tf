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

resource "azurerm_lb" "lbe-test-eastus-001" {
  name = "lbe-test-eastus-001"
  resource_group_name = "rg_sb_eastus_40287_1_171024271790"
  sku = "Standard"
  location = "eastus"

  frontend_ip_configuration {
    name = "fip-lbe-test-eastus-001"
    public_ip_address_id = azurerm_public_ip.pip-lbe-test-eastus-001.id
    //subnet_id = azurerm_subnet.terraform_lab_subnet.id
    }      
}

resource "azurerm_lb_backend_address_pool" "bep-lbe-test-001" {
    name = "bep-lbe-test-001"
    loadbalancer_id = azurerm_lb.lbe-test-eastus-001.id
    virtual_network_id = azurerm_virtual_network.vnet-test-eastus-001.id
}

resource "azurerm_lb_backend_address_pool_address" "lbe-test-eastus-001" {
  name = "lbe-test-eastus-001"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bep-lbe-test-001.id
  virtual_network_id = azurerm_virtual_network.vnet-test-eastus-001.id
  ip_address = azurerm_windows_virtual_machine.vmcasclabtest01.private_ip_address

}

resource "azurerm_lb_backend_address_pool_address" "lbe-test-eastus-002" {
  name = "lbe-test-eastus-002"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bep-lbe-test-001.id
  virtual_network_id = azurerm_virtual_network.vnet-test-eastus-001.id
  ip_address = azurerm_windows_virtual_machine.vmcasclabtest02.private_ip_address
}

resource "azurerm_lb_rule" "inr-lbe-test-001" {
    name = "inr-lbe-test-001"
    protocol = "Tcp"
    backend_port = "80"
    frontend_port = "80"
    loadbalancer_id = azurerm_lb.lbe-test-eastus-001.id
    frontend_ip_configuration_name = azurerm_lb.lbe-test-eastus-001.frontend_ip_configuration[0].name
    backend_address_pool_ids = [azurerm_lb_backend_address_pool.bep-lbe-test-001.id]
    probe_id = azurerm_lb_probe.prb-lbe-test-001.id
}
#Creating subnet for @Vnet which will be used for LB and VMs
resource "azurerm_subnet" "snet-test-eastus-001" {
  name = "snet-test-eastus-001"
  virtual_network_name = azurerm_virtual_network.vnet-test-eastus-001.name
  address_prefixes = ["10.1.0.0/24"]
  resource_group_name = ""
}
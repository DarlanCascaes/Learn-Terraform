#Creating the public ip which will be used for @LoadBalancer
resource "azurerm_public_ip" "pip_lbe_test_eastus_001" {
  name = "pip-lbe-test-eastus-001"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
  sku = "Standard"
}



resource "azurerm_public_ip" "pip_vmcasclab01_test_eastus_001" {
  name = "pip-vmcasclab01-test-eastus-001"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
  sku = "Standard"
}



resource "azurerm_public_ip" "pip_vmcasclab02_test_eastus_001" {
  name = "pip-vmcasclab02-test-eastus-001"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
  sku = "Standard"
}


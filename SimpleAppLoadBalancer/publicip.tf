#Creating the public ip which will be used for @LoadBalancer
resource "azurerm_public_ip" "pip-lbe-test-eastus-001" {
  name = "pip-lbe-test-eastus-001"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171076047662"
  allocation_method = "Static"
  sku = "Standard"
}

output "pip-lbe-test-eastus-001" {
    value = azurerm_public_ip.pip-lbe-test-eastus-001.ip_address
}

resource "azurerm_public_ip" "pip-vmcasclab01-test-eastus-001" {
  name = "pip-vmcasclab01-test-eastus-001"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171076047662"
  allocation_method = "Static"
  sku = "Standard"
}

output "pip-vmcasclab01-test-eastus-001" {
    value = azurerm_public_ip.pip-lbe-test-eastus-001.ip_address
}

resource "azurerm_public_ip" "pip-vmcasclab02-test-eastus-001" {
  name = "pip-vmcasclab02-test-eastus-001"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171076047662"
  allocation_method = "Static"
  sku = "Standard"
}

output "pip-vmcasclab02-test-eastus-001"{
  value = azurerm_public_ip.pip-vmcasclab02-test-eastus-001.ip_address
}

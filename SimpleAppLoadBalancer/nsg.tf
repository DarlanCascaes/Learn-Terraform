#Creating the NSG which will be used for @LPublicIp
resource "azurerm_network_security_group" "terraform_lab_nsg" {
  name = "terraform-lab-nsg"
  resource_group_name = "rg_sb_eastus_40287_1_171010357883"
  location = "eastus"

  security_rule {
    name = "RDP"
    priority = "1000"
    direction = "Inbound"
    access = "Allow"
    protocol = "*"
    source_port_range = "*"
    destination_port_range = "3389"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name = "WEB"
    priority = "2000"
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

#Connecting NSG into the Subnet
resource "azurerm_subnet_network_security_group_association" "terraform_lab_nsg_ga" {
    subnet_id = azurerm_subnet.terraform_lab_subnet
    network_security_group_id = azurerm_network_security_group.terraform_lab_nsg.id
}
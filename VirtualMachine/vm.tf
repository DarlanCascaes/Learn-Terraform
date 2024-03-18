terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}

provider "azurerm"{
  features {}
  skip_provider_registration = "true"
}

# Create virtual network
resource "azurerm_virtual_network" "terraform_network" {
  name                = "terraform_network-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = ""
}

# Create subnet
resource "azurerm_subnet" "terraform_subnet" {
  name                 = "terraform_network-subnet"
  resource_group_name = ""
  virtual_network_name = azurerm_virtual_network.terraform_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "terraform_public_ip" {
  name                = "terraform-public-ip"
  location            = "eastus"
  resource_group_name = ""
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "terraform_nsg" {
  name                = "terraform-nsg"
  location            = "eastus"
  resource_group_name = ""

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "terraform_nic" {
  name                = "terraform-nic"
  location            = "eastus"
  resource_group_name = ""

  ip_configuration {
    name                          = "nic_configuration"
    subnet_id                     = azurerm_subnet.terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.terraform_nic.id
  network_security_group_id = azurerm_network_security_group.terraform_nsg.id
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "terraform_storage_account" {
  name                     = "darlantfstorageaccount"
  location                 = "eastus"
  resource_group_name      = ""
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "terraform-vm"
  admin_username        = ""
  admin_password        = ""
  location              = "eastus"
  resource_group_name   = ""
  network_interface_ids = [azurerm_network_interface.terraform_nic.id]
  size                  = "standard_B1s"

  os_disk {
    name                 = "darlanterraformDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }


  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.terraform_storage_account.primary_blob_endpoint
  }
}

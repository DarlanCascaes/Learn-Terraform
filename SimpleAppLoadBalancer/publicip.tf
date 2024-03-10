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

#Creating the public ip which will be used for @LoadBalancer
resource "azurerm_public_ip" "terraform_lab_pip" {
  name = "terraform-lab-pip"
  location = "eastus"
  resource_group_name = "rg_sb_eastus_40287_1_171010357883"
  allocation_method = "Dynamic"
}
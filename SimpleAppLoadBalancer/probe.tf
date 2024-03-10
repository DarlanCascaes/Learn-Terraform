terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}

resource "azurerm_lb_probe" "terraform_lab_probe" {
  port = "80"
  name = "terraform-lab-probe"
  loadbalancer_id = azurerm_lb.terraform_lab_lb.id
}
resource "azurerm_lb_probe" "terraform_lab_probe" {

  port = "80"
  name = "terraform-lab-probe"
  loadbalancer_id = azurerm_lb.terraform_lab_lb.id
}
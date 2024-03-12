resource "azurerm_lb_probe" "prb-lbe-test-001" {

  port = "80"
  name = "prb-lbe-test-001"
  loadbalancer_id = azurerm_lb.lbe-test-eastus-001.id
}
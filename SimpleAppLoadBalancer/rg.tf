resource "azurerm_resource_group" rg{
    location = var.region
    name = var.rg_name
}
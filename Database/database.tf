terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}


provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}

resource "azurerm_storage_account" "darlanexample" {
  name                     = "darlanexamplesa"
  resource_group_name      = ""
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "darlanexample" {
  name                         = "darlan-example-sqlserver"
  resource_group_name          = ""
  location                     = "eastus"
  version                      = "12.0"
  administrator_login          = ""
  administrator_login_password = ""
}

resource "azurerm_mssql_database" "darlanexample" {
  name           = "darlan-example-db"
  server_id      = azurerm_mssql_server.darlanexample.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  sku_name       = "Basic"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
}

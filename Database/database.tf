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
  resource_group_name      = "rg_sb_eastus_40287_1_170808143113"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "darlanexample" {
  name                         = "darlan-example-sqlserver"
  resource_group_name          = "rg_sb_eastus_40287_1_170808143113"
  location                     = "eastus"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "darlanexample" {
  name           = "darlan-example-db"
  server_id      = azurerm_mssql_server.darlanexample.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  sku_name       = "Basic"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
}
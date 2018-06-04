provider "azurerm" { }


  resource "azurerm_resource_group" "terraformdemo" {
  name     = "terraformjenkinsdemo"
  location = "eastus"
}


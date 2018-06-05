provider "azurerm" { }


  resource "azurerm_resource_group" "terraformdemo" {
  name     = "terraformjenkinsdemo"
  location = "eastus"
}

  resource "azurerm_virtual_network" "network" {
  name                = "terraformjenkinsnetwork"
  address_space       = ["172.50.0.0/16"]
  location            = "eastus"
  resource_group_name = "${azurerm_resource_group.terraformdemo.name}"

}





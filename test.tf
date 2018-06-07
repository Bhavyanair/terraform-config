provider "azurerm" { }

resource "azurerm_resource_group" "test2" {
  name     = "Bhavya"
  location = "East US"

}

resource "azurerm_virtual_network" "test2" {
  name                = "terraformtestvn"
  address_space       = ["172.70.0.0/16"]
  location            = "${azurerm_resource_group.test2.location}"
  resource_group_name = "${azurerm_resource_group.test2.name}"
}

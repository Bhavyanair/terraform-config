provider "azurerm" { }

resource "azurerm_resource_group" "test" {
  name     = "Bhavya"
  location = "East US"

}


resource "azurerm_virtual_network" "test" {
  name                = "terraformtestvn"
  address_space       = ["172.60.0.0/16"]
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}

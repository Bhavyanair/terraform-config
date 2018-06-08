provider "azurerm" { }

resource "azurerm_resource_group" "terraformtest" {
  name     = "terraformrgtest"
  location = "South India"
}

resource "azurerm_virtual_network" "terraformtest" {
  name                = "terraformrgtestvn"
  address_space       = ["172.10.0.0/16"]
  location            = "${azurerm_resource_group.terraformtest.location}"
  resource_group_name = "${azurerm_resource_group.terraformtest.name}"
}


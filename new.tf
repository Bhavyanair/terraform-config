provider "azurerm" { }

resource "azurerm_resource_group" "new" {
  name     = "terraformrgnew"
  location = "South India"
}

resource "azurerm_virtual_network" "new" {
  name                = "terraformrgnewvn"
  address_space       = ["172.10.0.0/16"]
  location            = "${azurerm_resource_group.new.location}"
  resource_group_name = "${azurerm_resource_group.new.name}"
}


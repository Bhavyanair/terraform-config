provider "azurerm" { }

resource "azurerm_resource_group" "test" {
  name     = "terraformtestrg"
  location = "South India"
}

resource "azurerm_virtual_network" "test" {
  name                = "terraformtestvn"
  address_space       = ["172.60.0.0/16"]
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_subnet" "test" {
  name                 = "terraformtestsub"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  address_prefix       = "172.60.10.0/24"
}

resource "azurerm_network_interface" "test" {
  name                = "terraformtestnic"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.test.id}"
    private_ip_address_allocation = "dynamic"
  }
}



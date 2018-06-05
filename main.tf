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

  resource "azurerm_subnet" "subnet" {
  name                 = "terraformjenkinssubnet"
  resource_group_name  = "${azurerm_resource_group.terraformdemo.name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix       = "172.50.10.0/24"
 }

  resource "azurerm_public_ip" "publicip" {
  name                 = "terraformjenkinspublicip"
  location             = "eastus"
  resource_group_name  = "${azurerm_resource_group.terraformdemo.name}"
  public_ip_address_allocation = "Static"

}

  resource "azurerm_network_security_group" "nsg" {
  name                = "terraformjenkinsnsg"
  location            = "eastus"
  resource_group_name = "${azurerm_resource_group.terraformdemo.name}"

  security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}


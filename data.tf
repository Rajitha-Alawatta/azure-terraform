data "azurerm_virtual_network" "vnet" {
  name                = "test-vnet"
  resource_group_name = data.azurerm_resource_group.test_rg.name
}

data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.test_rg.name
}

data "azurerm_resource_group" "test_rg" {
  name = "test-vnet-new"
}
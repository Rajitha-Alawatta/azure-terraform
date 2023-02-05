resource "azurerm_private_dns_zone" "example" {
  name                = "mydomaincosmostest.com"
  resource_group_name = data.azurerm_resource_group.test_rg.name
}
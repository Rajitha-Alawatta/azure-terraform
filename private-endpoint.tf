resource "azurerm_private_endpoint" "example" {
  name                = "test-pe"
  location            = data.azurerm_resource_group.test_rg.location
  resource_group_name = data.azurerm_resource_group.test_rg.name
  subnet_id           = data.azurerm_subnet.example.id

  private_service_connection {
    name                           = "tfex-cosmosdb-connection"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_cosmosdb_account.db.id
    subresource_names              = ["MongoDB"]
  }

  private_dns_zone_group {
    name = "privatednszone"
    private_dns_zone_ids = [azurerm_private_dns_zone.example.id]
  }

  depends_on = [
    azurerm_private_dns_zone.example
  ]
}
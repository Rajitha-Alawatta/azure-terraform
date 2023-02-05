resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "West Europe"
}


resource "azurerm_cosmosdb_account" "db" {
  name                = "test-cosmosdb-devops-nn"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "westus"
    failover_priority = 0
  }
}
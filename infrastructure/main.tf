resource "azurerm_resource_group" "main" {
  name     = "rg-vm-demo"
  location = "CanadaCentral"
}

resource "azurerm_storage_account" "main" {
  name = "stgdemo${random_string.storage_name.result}"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  account_tier = "asdqwe"
  account_replication_type = "LRS"

  tags = {
    environment = "demo"
  }
}

resource "random_string" "storage_name" {
  length = 8
  special = false
  upper = false
}

output "storage_account_id" {
  value       = azurerm_storage_account.main.id
  description = "The ID of the created storage account"
}

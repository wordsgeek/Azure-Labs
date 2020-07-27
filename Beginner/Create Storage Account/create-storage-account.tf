# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "StorageAccountRG" {
  name     = var.RGName     # Resource Group Name
  location = var.RGLocation # Resource Group Location
}

# Create a Storage Account
resource "azurerm_storage_account" "StorageAccount" {
  name                     = var.StorageAccountName                           # Storage Account Name
  resource_group_name      = azurerm_resource_group.StorageAccountRG.name     # Resource Group Name
  location                 = azurerm_resource_group.StorageAccountRG.location # Resource Group Location 
  account_tier             = var.account_tier                                 # Storage Account Tier Standard or Premium
  account_replication_type = var.account_replication_type                     # Storage Account replication type

  # Add the Tagging to the Storage Account
  tags = {
    environment = "Test" # Tag Name
  }
}

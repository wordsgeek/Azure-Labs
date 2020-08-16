# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}

# Create Azure Storage Container
resource "azurerm_storage_container" "StorageContainer" {
  name                  = var.StorageContainerName       # Azure Storage Container Name
  storage_account_name  = var.StorageAccountName         # Storage Account Name
  container_access_type = var.StorageContainerAccessType # Quota of File Share
}

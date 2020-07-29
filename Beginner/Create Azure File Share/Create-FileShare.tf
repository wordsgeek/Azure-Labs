# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}

# Create Azure File Share
resource "azurerm_storage_share" "AzureFileShare" {
  name                 = var.FileShareName      # Azure File Share Name
  storage_account_name = var.StorageAccountName # Storage Account Name
  quota                = var.FileShareQuota     # Quota of File Share
}

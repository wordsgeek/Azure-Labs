# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}

resource "azurerm_subnet" "Subnet3" {
  name                 = var.Subnet3Name # Name of Subnet
  resource_group_name  = var.RGName      # Name of Resource Group in which VNet is located
  virtual_network_name = var.VNetName    # Name of Virtual Network
  address_prefix       = var.Subnet3IP   # Subnet CIDR
}

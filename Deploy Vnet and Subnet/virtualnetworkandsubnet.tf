# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "VNet-rg" {
  name     = var.RGName     # Resource Group Name
  location = var.RGLocation # Resource Group Location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "VNet" {
  name                = var.VNetName                            # Virtual Network Name
  resource_group_name = azurerm_resource_group.VNet-rg.name     # Virtual Network Resource Group
  location            = azurerm_resource_group.VNet-rg.location # Virtual Network Location
  address_space       = var.VNetIP                              # Virtual Network CIDR

  # Create multiple subnets within the Virtual Network
  subnet {
    name           = var.Subnet1Name # First Subnet Name
    address_prefix = var.Subnet1IP   # FIrst Subnet CIDR
  }

  subnet {
    name           = var.Subnet2Name # Second Subnet Name
    address_prefix = var.Subnet2IP   # Second Subnet CIDR
  }

  # Add the Tagging to the Virtual Network.
  tags = {
    environment = "Test" # Tag Name
  }

}

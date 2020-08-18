# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}

# Refer to a subnet
data "azurerm_subnet" "Subnet" {
  name                 = var.subname  # Name of the Subnet
  virtual_network_name = var.VNetname # Name of the Virtual Network
  resource_group_name  = var.VNetrg   # VNet Resource group Name
}
# Refer to a Resource Group
resource "azurerm_resource_group" "RGName" {
  name     = var.VMrgname # Name of the Resource group where VM would be created
  location = var.location # Location of the Resource group where VM would be created
}
# Refer to a Network Security Group
resource "azurerm_network_security_group" "NSG" {
  name                = "WinDemoVM-NSG"                        # NSG Name
  location            = azurerm_resource_group.RGName.location # NSG Location
  resource_group_name = azurerm_resource_group.RGName.name     # NSG Resource Group name
  # Characteristics of Security rules.
  security_rule {
    name                       = "TestRule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Test"
  }
}

# Refer to a Public IP
resource "azurerm_public_ip" "pip" {
  name                = "externalIP"                           # Name of the Public IP
  resource_group_name = azurerm_resource_group.RGName.name     # Resource Group where Public IP will be created
  location            = azurerm_resource_group.RGName.location # Location in which Public IP will be created
  allocation_method   = "Dynamic"                              # Allocation type either Static or Dynamic
}
# Refer to a Network Interface
resource "azurerm_network_interface" "VMNic" {
  name                = "WinDemoVMnic1"                    # Name of the Network Interface
  location            = var.location                       # Location in which the Network Interface is created
  resource_group_name = azurerm_resource_group.RGName.name # Resource group where Network Interface will be created

  ip_configuration {
    name                          = "internalIP"                  # Name assigned to the Private IP
    subnet_id                     = data.azurerm_subnet.Subnet.id # Subnet from which the Private IP is choosen
    private_ip_address_allocation = "Dynamic"                     # Allocation type either Static or Dynamic
    public_ip_address_id          = azurerm_public_ip.pip.id      # Attaching Public IP to Network Interface
  }
}
# Attach NSG to Network Interface of the VM
resource "azurerm_network_interface_security_group_association" "NSGattachment" {
  network_interface_id      = azurerm_network_interface.VMNic.id
  network_security_group_id = azurerm_network_security_group.NSG.id
}

# Refer to a Virtual Machine
resource "azurerm_windows_virtual_machine" "WinVM" {
  name                = var.VMname                             # Virtual Machine Name
  resource_group_name = azurerm_resource_group.RGName.name     # Virtual Machine Resource Group
  location            = azurerm_resource_group.RGName.location # Virtual Machine Location
  size                = var.VMsize                             # Virtual Machine size
  admin_username      = "adminuser"                            # Virtual Machine Admin Username
  admin_password      = "P@$$w0rd1234!"                        # Virtual Machine Admin Password
  network_interface_ids = [
    azurerm_network_interface.VMNic.id, # Attaching the Network Interface with the VM
  ]

  os_disk {
    caching              = "ReadWrite"    # OS disk caching behaviour
    storage_account_type = "Standard_LRS" # Storage Account type for the VM
  }
  # Refer to a Virtual Machine Image from Azure Market Place
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  tags = {
    environment = "Test" # Any relevant tags as per requirement
  }
}

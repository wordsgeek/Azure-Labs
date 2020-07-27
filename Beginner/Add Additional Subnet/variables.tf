variable "RGName" {
  type    = string
  default = "DemoVnet-rg" # Resource Group Name
}

variable "VNetName" {
  type    = string
  default = "DemoVnet"    # Virtual Network Name
}

variable "Subnet3Name" {
  type    = string
  default = "Subnet3"     # Subnet 3 Name
}

variable "Subnet3IP" { 
  default = "10.0.3.0/24" # Subnet 3 IP
}

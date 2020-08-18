variable "subname" {
  type    = string
  default = "Subnet1"
}

variable "VNetname" {
  type    = string
  default = "DemoVnet"
}

variable "VNetrg" {
  type    = string
  default = "DemoVnet-rg"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "VMrgname" {
  type    = string
  default = "WinDemoVM-rg"
}

variable "VMname" {
  type    = string
  default = "WinDemoVM"
}

variable "VMsize" {
  type    = string
  default = "Standard_B1s"
}

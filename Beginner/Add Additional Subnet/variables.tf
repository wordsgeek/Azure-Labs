variable "RGName" {
  type    = string
  default = "DemoVnet-rg"
}

variable "VNetName" {
  type    = string
  default = "DemoVnet"
}

variable "Subnet3Name" {
  type    = string
  default = "Subnet3"
}

variable "Subnet3IP" {
  default = "10.0.3.0/24"
}

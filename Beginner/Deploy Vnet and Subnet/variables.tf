variable "RGName" {
  type    = string
  default = "DemoVnet-rg"
}

variable "RGLocation" {
  type    = string
  default = "West Europe"
}

variable "VNetName" {
  type    = string
  default = "DemoVnet"
}

variable "VNetIP" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "Subnet1Name" {
  type    = string
  default = "Subnet1"
}

variable "Subnet1IP" {
  default = "10.0.1.0/24"
}

variable "Subnet2Name" {
  type    = string
  default = "Subnet2"
}

variable "Subnet2IP" {
  default = "10.0.2.0/24"
}

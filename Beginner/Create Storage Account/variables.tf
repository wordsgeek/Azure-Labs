variable "RGName" {
  type    = string
  default = "storageaccdemo-rg"
}

variable "RGLocation" {
  type    = string
  default = "West Europe"
}

variable "StorageAccountName" {
  type    = string             # The name must be unique across all existing storage account names in Azure. 
  default = "storageaccdemo12" # It must be 3 to 24 characters long, and can contain only lowercase letters and numbers.
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

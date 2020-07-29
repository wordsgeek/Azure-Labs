variable "FileShareName" {
  type    = string             # File share names can contain only lowercase letters, numbers, and hyphens, and must begin and end with a letter or a number.  
  default = "demoshare"        # The name cannot contain two consecutive hyphens. It must be 3 to 63 characters long.
}

variable "StorageAccountName" {
  type    = string             # The name must be unique across all existing storage account names in Azure. 
  default = "storageaccdemo12" # It must be 3 to 24 characters long, and can contain only lowercase letters and numbers.
}

variable "FileShareQuota" {
  type    = number
  default = 1                  # Set a quota in GiB, up to 5120 GiB, to limit the total size of files on the share
}

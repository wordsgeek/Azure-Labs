variable "StorageContainerName" {
  type    = string            # This name may only contain lowercase letters, numbers, and hyphens, and must begin with a letter or a number. 
  default = "demostcontainer" # Each hyphen must be preceded and followed by a non-hyphen character. The name must also be between 3 and 63 characters long.  
}

variable "StorageAccountName" {
  type    = string             # The name must be unique across all existing storage account names in Azure. 
  default = "storageaccdemo12" # It must be 3 to 24 characters long, and can contain only lowercase letters and numbers.
}

variable "StorageContainerAccessType" {
  type    = string    # Specifies whether data in the container may be accessed publicly. By default, container data is private to the account owner. 
  default = "private" # Use 'Blob' to allow public read access for blobs. Use 'Container' to allow public read and list access to the entire container.                   
}

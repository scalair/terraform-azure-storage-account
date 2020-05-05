# Generic Variables

variable "resource_group_name" {
  description = "Name of the resource where the storage will be created"
  type        = string
  default     = ""
}

variable "location" {
  description = "One of the Azure region for the resource provisioning"
  type        = string
  default     = ""
}

# Azure Storage Account variables resource

variable "sa_name" {
  description = "Name of the storage account"
  type        = string
  default     = ""
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are Storage, StorageV2 and BlobStorage. Changing this forces a new resource to be created."
  type        = string
  default     = "Storage"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage accounts. Valid options are Hot and Cold, defaults to Hot."
  type        = string
  default     = "hot"
}

variable "https_traffic" {
  description = "Boolean flag which forces HTTPS if enabled"
  type        = string
  default     = true
}

variable "containers" {
  type = list(object({
    name        = string
    access_type = string
  }))
  default     = []
  description = "List of storage containers."
}

variable "shares" {
  type = list(object({
    name  = string
    quota = number
  }))
  default     = []
  description = "List of storage shares."
}

# Default tags

variable "tags" {
  description = "Default tags to apply on the resource"
  type        = map

  default = {
    terraform = "true"
  }
}

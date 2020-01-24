resource "azurerm_storage_account" "this" {
  name                      = var.sa_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  enable_blob_encryption    = var.blob_encryption
  enable_file_encryption    = var.file_encryption
  enable_https_traffic_only = var.https_traffic
  account_encryption_source = var.account_encryption_source

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  count                 = length(var.containers)
  name                  = var.containers[count.index].name
  resource_group_name   = azurerm_storage_account.this.resource_group_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.containers[count.index].access_type
}

resource "azurerm_storage_share" "main" {
  count                = length(var.shares)
  name                 = var.shares[count.index].name
  resource_group_name  = azurerm_storage_account.this.resource_group_name
  storage_account_name = azurerm_storage_account.this.name
  quota                = var.shares[count.index].quota
}

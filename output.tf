# Storage account outputs

output storage_account_id {
  value = azurerm_storage_account.this.id
}

output storage_account_name {
  value = azurerm_storage_account.this.name
}

output storage_account_kind {
  value = azurerm_storage_account.this.account_kind
}

output storage_account_account_tier {
  value = azurerm_storage_account.this.account_tier
}

output storage_account_replication_type {
  value = azurerm_storage_account.this.account_replication_type
}

output storage_account_primary_location {
  value = azurerm_storage_account.this.primary_location
}

output storage_account_secondary_location {
  value = azurerm_storage_account.this.secondary_location
}

output storage_account_primary_blob_endpoint {
  value = azurerm_storage_account.this.primary_blob_endpoint
}

output storage_account_primary_queue_endpoint {
  value = azurerm_storage_account.this.primary_queue_endpoint
}

output storage_account_primary_table_endpoint {
  value = azurerm_storage_account.this.primary_table_endpoint
}

output storage_account_primary_file_endpoint {
  value = azurerm_storage_account.this.primary_file_endpoint
}

output storage_account_primary_access_key {
  value = azurerm_storage_account.this.primary_access_key
}

output storage_account_secondary_access_key {
  value = azurerm_storage_account.this.secondary_access_key
}

output storage_account_primary_connection_string {
  value = azurerm_storage_account.this.primary_connection_string
}

output storage_account_primary_blob_string {
  value = azurerm_storage_account.this.primary_blob_connection_string
}

# Storage container outputs

output "containers" {
  value = {
    for i in azurerm_storage_container.this :
    i.name => {
      id   = i.id
      name = i.name
    }
  }
  description = "Map of containers."
}

# Storage share outputs

output "shares" {
  value = { for j in azurerm_storage_share.this :
    j.name => {
      id   = j.id
      name = j.name
    }
  }
  description = "Map of shares."
}

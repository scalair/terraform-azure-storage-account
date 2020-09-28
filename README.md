# azurerm_storage_account

Terraform module which creates azure storage account with the ability to manage the following features:
- Lifecyle rules
- Network and firewall rules
- Cross-origin resource sharing


This module is tested with:
- Azure Provider 2.13.0
- Terrafrom v0.12.23

It can create the following resources:
- azurerm_storage_account
- azurerm_storage_management_policy
- azurerm_storage_container
- azurerm_storage_share


Terragrunt instance example is provided below:

```hcl
inputs = {
  resource_group_name       = "resource_group_name"
  location                  = "Azure_region"
  sa_name                   = "Service_account_name"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  is_hns_enabled              = true

  network_rules = [
    {
      default_action              = "Allow"
      bypass                      = ["AzureServices"]
      ip_rules                    = ["IP"]
      virtual_network_subnet_ids  = ["vnet_subnet_id"]
    }
  ]

  containers = [
    {
      name = "container1",
      access_type = "blob"
    }
  ]

  blob_properties_cors_rules    = [
    {
      allowed_headers         = []
      allowed_methods         = ["GET"]
      allowed_origins         = ["https://testfreyu.com"]
      exposed_headers         = []
      max_age_in_seconds      = 47

    }
  ]

  add_lifecycle_rules         = true
  lifcecycle_rules            = [
    {
      name                    = "rule1"
      enabled                 = true
      prefix_match            = []
      blob_types              = ["blockBlob"]
      tier_to_cool_after_days_since_modification_greater_than     = 0
      tier_to_archive_after_days_since_modification_greater_than  = 0
      delete_after_days_since_modification_greater_than           = 5
      delete_snapshot_after_days_since_creation_greater_than  = 5
    }
  ]

  tags = {
     terrafromd   = "true"
  }
}
```
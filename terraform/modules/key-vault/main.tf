resource "azurerm_key_vault" "main" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  rbac_authorization_enabled  = true
  enabled_for_disk_encryption = false
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true

  sku_name = "standard"

  tags = var.tags

}
output "key_vault_id" {
  description = "Reference the vault in other modules"
  value       = azurerm_key_vault.main.key_vault_id
}

output "key_vault_name" {
  description = "Reference the vault in other modules"
  value       = azurerm_key_vault.main.key_vault_name
}

output "key_vault_uri" {
  description = "Reference the vault in other modules"
  value       = azurerm_key_vault.main.key_vault_uri
}



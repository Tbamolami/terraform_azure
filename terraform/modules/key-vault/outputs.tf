output "key_vault_id" {
  description = "Reference the vault in other modules"
  value       = azurerm_key_vault.main.key_id
}

output "key_vault_name" {
  description = "Reference the vault in other modules"
  value       = azurerm_key_vault.main.key_name
}

output "key_vault_uri" {
  description = "Reference the vault in other modules"
  value       = azurerm_key_vault.main.uri
}



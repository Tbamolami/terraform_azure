
output "registry_id" {
  description = "Resource ID of the Azure Container Registry."
  value       = azurerm_container_registry.main.id
}

output "registry_name" {
  description = "Name of the Azure Container Registry."
  value       = azurerm_container_registry.main.name
}

output "login_server" {
  description = "Login server URL for pushing and pulling container images."
  value       = azurerm_container_registry.main.login_server
}

output "admin_enabled" {
  description = "Whether the registry admin account is enabled."
  value       = azurerm_container_registry.main.admin_enabled
}

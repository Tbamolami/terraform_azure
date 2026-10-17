
output "container_app_id" {
  description = "Resource ID of the Azure Container App."
  value       = azurerm_container_app.main.id
}

output "container_app_name" {
  description = "Name of the Azure Container App."
  value       = azurerm_container_app.main.name
}

output "container_app_url" {
  description = "Fully qualified domain name of the Container App."
  value       = "https://${azurerm_container_app.main.ingress[0].fqdn}"
}

output "container_app_environment_id" {
  description = "Resource ID of the Container Apps environment."
  value       = azurerm_container_app_environment.main.id
}

output "container_app_principal_id" {
  description = "Principal ID of the system-assigned managed identity."
  value       = azurerm_container_app.main.identity[0].principal_id
}

output "container_app_latest_revision_name" {
  description = "Name of the latest Container App revision."
  value       = azurerm_container_app.main.latest_revision_name
}

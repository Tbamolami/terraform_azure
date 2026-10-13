
output "vnet_id" {
  description = "Resource ID of the virtual network."
  value       = azurerm_virtual_network.main.id
}

output "app_subnet_id" {
  description = "Resource ID of the application subnet."
  value       = azurerm_subnet.app.id
}

output "management_subnet_id" {
  description = "Resource ID of the management subnet."
  value       = azurerm_subnet.management.id
}

output "app_nsg_id" {
  description = "Resource ID of the application network security group."
  value       = azurerm_network_security_group.app.id
}

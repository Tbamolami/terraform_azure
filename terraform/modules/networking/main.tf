
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "azure-hybrid-infrastructure"
  }
}

resource "azurerm_subnet" "app" {
  name                 = "snet-app"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.app_subnet_prefix
}

resource "azurerm_subnet" "management" {
  name                 = "snet-management"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.management_subnet_prefix
}

resource "azurerm_network_security_group" "app" {
  name                = "nsg-app-dev"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}

data "azurerm_monitor_diagnostic_categories" "app_nsg" {
  resource_id = azurerm_network_security_group.app.id
}

resource "azurerm_monitor_diagnostic_setting" "nsg-app-dev" {
  name               = "nsg-app-dev"
  target_resource_id = azurerm_key_vault.app.id
  log_analytics_workspace_id = var.log_analytics_workspace.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.app_nsg.log_category_types

    content {
      category = enabled_log.value
    }
  }

  enabled_metric {
    category = "AllMetrics"
  }
}


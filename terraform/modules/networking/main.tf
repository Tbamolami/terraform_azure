
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

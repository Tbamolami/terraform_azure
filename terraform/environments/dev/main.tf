resource "azurerm_resource_group" "main" {
  name     = "rg-finance-dev"
  location = "canadacentral"

  tags = {
    Environment = "dev"
    Project     = "azure-hybrid-infrastructure"
    ManagedBy   = "Terraform"
  }
}


module "networking" {
  source = "../../modules/networking"
  resource_group_name     = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  vnet_name               = "vnet-finance-dev"
  vnet_address_space      = ["10.10.0.0/16"]
  app_subnet_prefix       = ["10.10.1.0/24"]
  management_subnet_prefix = ["10.10.2.0/24"]
  log_analytics_workspace_id = module.monitoring.workspace_id

}



module "monitoring" {
  source = "../../modules/monitoring"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  workspace_name      = "law-finance-dev"
  retention_in_days   = 30
}


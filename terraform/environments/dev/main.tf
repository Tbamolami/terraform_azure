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
  source              = "../../modules/networking"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_name                        = "vnet-finance-dev"
  vnet_address_space               = ["10.10.0.0/16"]
  app_subnet_prefix                = ["10.10.1.0/24"]
  management_subnet_prefix         = ["10.10.2.0/24"]
  database_anagement_subnet_prefix = ["10.10.3.0/24"]
  log_analytics_workspace_id       = module.monitoring.workspace_id

}



module "monitoring" {
  source = "../../modules/monitoring"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  workspace_name      = "law-finance-dev"
  retention_in_days   = 30
}


module "key-vault" {

  source              = "../../modules/key-vault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  key_vault_name      = "kv-finance-dev-76325"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags = {
    Environment = "dev"
    Project     = "azure-hybrid-infrastructure"
    ManagedBy   = "Terraform"
  }

}



module "database" {
  source = "../../modules/database"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  server_name            = "tbam-appdb-21343"
  administrator_login    = "umis"
  administrator_password = "Theater12.@"

  database_subnet_id = module.networking.database_subnet_id
  virtual_network_id = module.networking.vnet_id

  tags = {
    Environment = "dev"
    Project     = "azure-hybrid-infrastructure"
    ManagedBy   = "Terraform"
  }
}


module "container-reg" {
  source = "../../modules/container-registry"

  registry_name       = "tbamappacr21343"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  tags = {
    Environment = "dev"
    Project     = "azure-hybrid-infrastructure"
    ManagedBy   = "Terraform"
  }
}


module "container_apps" {
  source = "../../modules/container-apps"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  environment_name  = "cae-finance-dev"
  container_app_name = "album-api-dev"

  container_image = "${module.container-reg.login_server}/album-api:latest"
  acr_login_server = module.container-reg.login_server
  acr_id           = module.container-reg.registry_id

  log_analytics_workspace_id = module.monitoring.workspace_id

  tags = {
    Environment = "dev"
    Project     = "azure-hybrid-infrastructure"
    ManagedBy   = "Terraform"
  }
}



resource "azurerm_resource_group" "main" {
  name     = "rg-finance-dev"
  location = "canadacentral"

  tags = {
    Environment = "dev"
    Project     = "azure-hybrid-infrastructure"
    ManagedBy   = "Terraform"
  }
}
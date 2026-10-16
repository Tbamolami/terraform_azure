variable "resource_group_name" {
   description = "Name of the resource group that will contain the Key Vault."
  type        = string

}

variable "location" {
   description = "Azure region where the Key Vault will be deployed"
  type        = string

}

variable "key_vault_name" {
   description = "Globally unique name of the Key Vault."
  type        = string

}

variable "tenant_id" {
   description = "Microsoft Entra tenant ID for the vault"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Key Vault"
  type        = map(string)

}


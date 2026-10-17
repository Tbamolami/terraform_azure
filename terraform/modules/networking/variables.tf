
variable "resource_group_name" {
  description = "Resource group where the network will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the network."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space allocated to the virtual network."
  type        = list(string)
}

variable "app_subnet_prefix" {
  description = "Address prefix for the application subnet."
  type        = list(string)
}

variable "management_subnet_prefix" {
  description = "Address prefix for the management subnet."
  type        = list(string)
}

variable "log_analytics_workspace_id" {
   description = "Address prefix for the management subnet."
  type        = string

}

variable "database_anagement_subnet_prefix" {
  description = "Address prefix for the management subnet."
  type        = list(string)
}
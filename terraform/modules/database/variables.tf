
variable "resource_group_name" {
  description = "Resource group where the network will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the network."
  type        = string
}

variable "server_name" {
  description = "Name of the server network."
  type        = string
}

variable "administrator_login" {
  description = "Database administrator username"
  type        = string
}

variable "administrator_password" {
  description = "Database administrator password"
  sensitive   = true
  type        = string
}

variable "database_subnet_id" {
  description = "ID of the Private DNS zone."
  type        = list(string)
}

variable "virtual_network_id" {
  description = "ID of the Private DNS zone."
  type        = list(string)
}


variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
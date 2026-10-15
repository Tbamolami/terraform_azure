
variable "resource_group_name" {
  description = "Resource group for monitoring resources."
  type        = string
}

variable "location" {
  description = "Azure region for monitoring resources."
  type        = string
}

variable "workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "retention_in_days" {
  description = "Workspace data retention period."
  type        = number
  default     = 30
}

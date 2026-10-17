variable "resource_group_name" {
  description = "Name of the resource group that will contain the container registry."
  type        = string

}

variable "location" {
  description = "Azure region where the container registry will be deployed."
  type        = string

}

variable "environment_name" {
  description = "Container Apps managed environment name"
  type        = string

}

variable "acr_id" {
  description = "Container Apps managed environment name"
  type        = string

}

variable "container_app_name" {
  description = "Name of the Album API app"
  type        = string

}

variable "container_image" {
  description = "Full ACR image reference, including tag"
  type        = string

}

variable "log_analytics_workspace_id" {
  description = "Workspace used for Container Apps logs"
  type        = string

}


variable "acr_login_server" {
  description = "ACR hostname"
  type        = string

}

variable "tags" {
  description = "Tags to apply to the container registry."
  type        = map(string)

}


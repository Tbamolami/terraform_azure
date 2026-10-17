variable "resource_group_name" {
  description = "Name of the resource group that will contain the container registry."
  type        = string

}

variable "location" {
  description = "Azure region where the container registry will be deployed."
  type        = string

}

variable "registry_name" {
  description = "Globally unique name of the Azure Container Registry"
  type        = string

}

variable "sku" {
  description = "SKU tier for the container registry."
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "Tags to apply to the container registry."
  type        = map(string)

}


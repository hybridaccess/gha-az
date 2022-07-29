variable "azurerm_resource_group" {
  type        = string
  description = "Name of resource group to deploy cassandra"
  default     = "poc-test-rg"
}

variable "name" {
  type        = string
  description = "Name of the cassandra cluster.  Note: This should be the same name as the existing cluster if configuring hybrid cluster."
  default     = "test"
}

terraform {

  required_version = ">= 0.14.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# Configure the Azure Provider.
provider "azurerm" {
  features {}
}

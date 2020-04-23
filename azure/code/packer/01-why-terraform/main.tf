terraform {
  required_version = ">= 0.12, < 0.13"
}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

provider "azurerm" {
  features {}

  # Allow any 2.x version of the Azure provider
  version = "~> 2.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "terraform_group" {
  name     = "terraform_group"
  location = "eastus"
}

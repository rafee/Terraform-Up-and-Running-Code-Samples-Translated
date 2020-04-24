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
data "azurerm_resource_group" "terraform_group" {
  name = "terraform_group"
}

# Create virtual network
resource "azurerm_virtual_network" "terraform_network" {
  name                = "terraform_network"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.terraform_group.name
}

# Create subnet
resource "azurerm_subnet" "terraform_subnet" {
  name                 = "terraform_subnet"
  resource_group_name  = data.azurerm_resource_group.terraform_group.name
  virtual_network_name = azurerm_virtual_network.terraform_network.name
  address_prefix       = "10.0.1.0/24"
}

# Create network interface
resource "azurerm_network_interface" "terraform_nic" {
  name                = "terraform_nic"
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.terraform_group.name

  ip_configuration {
    name                          = "terraform_nic_conf"
    subnet_id                     = azurerm_subnet.terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create VM using packer image
data "azurerm_image" "packer-example" {
  name                = "packer-example"
  resource_group_name = data.azurerm_resource_group.terraform_group.name
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "example" {
  name                  = "example"
  location              = "eastus"
  resource_group_name   = data.azurerm_resource_group.terraform_group.name
  network_interface_ids = [azurerm_network_interface.terraform_nic.id]
  size                  = "Standard_B1s"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_id = data.azurerm_image.packer-example.id

  admin_username = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("/home/rafee/.ssh/azure.pub")
  }
}

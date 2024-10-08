terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "tfresourgroupteste"
    storage_account_name  = "sr98we9r8we9r"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  client_id       = var.client_id       # Substitua pela variável ARM_CLIENT_ID
  client_secret   = var.client_secret   # Substitua pela variável ARM_CLIENT_SECRET
  subscription_id = var.subscription_id  # Substitua pela variável ARM_SUBSCRIPTION_ID
  tenant_id       = var.tenant_id       # Substitua pela variável ARM_TENANT_ID
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name

}

resource "azurerm_subnet" "public" {
  count                = var.subnet_count
  name                 = "${var.vnet_name}-subnet-${count.index}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [element(var.subnet_prefixes, count.index)]

}

resource "azurerm_network_security_group" "main" {
  name                = "${var.vnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

}

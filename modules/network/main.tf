terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = var.resource_group_name
    storage_account_name  = var.storage_account_name
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    provider "azurerm" {
      features {
      client_id       = var.client_id       # O appId do Service Principal
      client_secret   = var.client_secret   # A senha gerada (password)
      tenant_id       = var.tenant_id       # O tenant onde o Service Principal está
      subscription_id = var.subscription_id # O ID da sua assinatura do Azure
  }
}
  }
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

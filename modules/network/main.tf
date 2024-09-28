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

  client_id       = "f21fa1c1-38aa-426f-a33b-cb5329fb013b"      # O appId do Service Principal
  client_secret   = "0Pn8Q~DqMSjFivK1EsHoajiWjp3JSw8wUTUwnbnO"   # A senha gerada (password)
  tenant_id       = "a15af431-5679-4f86-bc34-2eae32433056"    # O tenant onde o Service Principal está
  subscription_id = "ad56e6da-120c-4d7c-85fd-8181ce503d23" # O ID da sua assinatura do Azure
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

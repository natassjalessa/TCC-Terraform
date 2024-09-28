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

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

}

module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnet_count        = var.subnet_count
  subnet_prefixes     = var.subnet_prefixes

  client_id           = var.client_id           # Adicione isso
  client_secret       = var.client_secret       # Adicione isso
  subscription_id     = var.subscription_id     # Adicione isso
  tenant_id           = var.tenant_id           # Adicione isso
  storage_account_name = var.storage_account_name # Adicione isso
}

resource "azurerm_network_interface" "tcc" {
  name                = "tcc-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = element(module.network.subnet_ids, 0)
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "tcc" {
  name                = "tcc-vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.tcc.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }
}

resource "azurerm_storage_account" "tcc" {
  name                      = "sr98we9r8we9r"
  resource_group_name       = azurerm_resource_group.main.name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = "sr98we9r8we9r"
  container_access_type = "private"
}


variable "location" {
  description = "Regiao do recurso do Azure"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do grupo de recurso"
  type        = string
}

variable "vnet_name" {
  description = "O nome da virtual network"
  type        = string
  default     = "tcc-vnet"
}

variable "vnet_address_space" {
  description = "O address space da virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  description = "O numero de subnets criados"
  type        = number
  default     = 2
}

variable "subnet_prefixes" {
  description = "Lista de address prefixos das subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vm_size" {
  description = "O tamanho da virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "O username administrador da virtual machine"
  type        = string
}

variable "ssh_public_key" {
  description = "Chave SSH publica para virtual machine"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account"
  type        = string
}

variable "client_id" {
  description = "The Client ID of the Service Principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret of the Service Principal."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID for the Azure subscription."
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID for the Azure account."
  type        = string
}

variable "storage_container_name" {
  description = "The name of the Storage Container for the Terraform state."
  type        = string
}

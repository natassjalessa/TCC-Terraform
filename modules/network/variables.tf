variable "location" {
  description = "Regiao onde ocorrerá deploy do recurso"
  type        = string
}

variable "resource_group_name" {
  description = "O nome do grupo de recurso"
  type        = string

}

variable "vnet_address_space" {
  description = "O address space da virtual network"
  type        = string

}

variable "vnet_name" {
  description = "O nome da virtual network"
  type        = string
}

variable "subnet_count" {
  description = "O numero de subnets para ser criada"
  type        = number

}

variable "subnet_prefixes" {
  description = "Lista de address prefixes para subnets"
  type        = list(string)
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

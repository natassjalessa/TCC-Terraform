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
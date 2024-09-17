output "vnet_id" {
  description = "O ID da virtual network"
  value       = module.network.vnet_id
}

output "subnet_ids" {
  description = "Os IDs das subnets"
  value       = module.network.subnet_ids
}

output "vm_id" {
  description = "O ID da maquina virtual"
  value       = azurerm_linux_virtual_machine.tcc.id
}
output "vnet_id" {
  description = "O ID da virtual network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_ids" {
  description = "Os IDs das subnets"
  value       = azurerm_subnet.public[*].id
}
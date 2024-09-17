location            = "East US"
resource_group_name = "tcc-resources"
vnet_name           = "tcc-vnet"
vnet_address_space  = "10.0.0.0/16"
subnet_count        = 2
subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
vm_size             = "Standard_DS1_v2"
admin_username      = "azureuser"
ssh_public_key      = "ssh-rsa AAAA... your-public-key ..."
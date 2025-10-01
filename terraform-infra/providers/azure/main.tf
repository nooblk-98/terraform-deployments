provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "sample" {
  name     = var.resource_group_name
  location = var.location
}

# Uncomment resources below as needed:

# resource "azurerm_virtual_network" "main" {
#   name                = "main-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = var.location
#   resource_group_name = azurerm_resource_group.sample.name
# }

# resource "azurerm_subnet" "main" {
#   name                 = "main-subnet"
#   resource_group_name  = azurerm_resource_group.sample.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_network_interface" "main" {
#   name                = "main-nic"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.sample.name
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.main.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "main" {
#   name                = "main-vm"
#   resource_group_name = azurerm_resource_group.sample.name
#   location            = var.location
#   size                = "Standard_B1s"
#   admin_username      = "azureuser"
#   network_interface_ids = [azurerm_network_interface.main.id]
#   admin_password      = "Password1234!"
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }

# resource "azurerm_storage_account" "main" {
#   name                     = "examplestorageacct"
#   resource_group_name      = azurerm_resource_group.sample.name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_sql_server" "main" {
#   name                         = "mysqlserver"
#   resource_group_name          = azurerm_resource_group.sample.name
#   location                     = var.location
#   version                      = "12.0"
#   administrator_login          = "sqladmin"
#   administrator_login_password = "Password1234!"
# }

module "az_windows_virtual_machine" {
  source                              = "../../az_windows_virtual_machine"
  resourcegroup_name                  = var.vm_resourcegroup_name
  virtual_machine_name                = var.virtual_machine_name
  vm_network_interface_name_subnet_id = data.azurerm_subnet.subnet.id
  vm_public_ip_address                = var.vm_public_ip_address
  location                            = var.location
}